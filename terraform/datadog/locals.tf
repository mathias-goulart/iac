locals {
  agent_keys_secrets_managed = {
    for k, v in var.agent_keys : k => v if v.store_in_secrets
  }
  sanitized_server_map = {
    for server in var.server_list :
    replace(server.name, regex("[^a-zA-Z0-9]", server.name), "_") => server
  }
  install_datadog_agent_on = {
    for k, v in local.sanitized_server_map : k => merge(v, {
      install_agent_script = replace(var.datadog_config.install_script_base_name, "<VERSION>", v.datadog_agent.version)
      dd_agent_key         = datadog_api_key.dd_agent_key[v.datadog_agent.key].key
      ssh = merge(v.ssh, {
        private_key_path = v.ssh.private_key_path != null ? "${replace(replace(v.ssh.private_key_path, "<SERVER_NAME>", v.name), "<SSH_DEFAULT_KEY_PATH>", local.datadog_global_config.ssh_private_key_path)}" : null
      })
      mkdir_command = [
        "mkdir -p /tmp/conf.d/apache.d",
        "mkdir -p /tmp/conf.d/disk.d",
        v.mysql_monitor != null ? "mkdir -p /tmp/conf.d/mysql.d" : "echo 'Server is not Database monitor'"
      ]
    }) if v.datadog_agent != null ? v.datadog_agent.install : false
  }

  monitors_disk_per_server = flatten([
    for k, v in local.sanitized_server_map : [
      for device in v.disk_monitor : {
        monitor_name = "${k}${replace(device, regex("[^a-zA-Z0-9]", device), "_")}"
        path         = device
        metric       = "host:${v.alias != null ? v.alias : k}, device:${device}"
        server_name  = v.name
      }
    ]
  ])
  map_monitors_disk_per_server = {
    for v in local.monitors_disk_per_server : v.monitor_name => v
  }

  datadog_global_config = merge(var.datadog_config, {
    ssh_private_key_path = replace(var.datadog_config.ssh_private_key_path, "<ROOT_MODULE_PATH>", path.root)
    agent_configuration = {
      destination = endswith(var.datadog_config.agent_configuration.destination, "/") ? var.datadog_config.agent_configuration.destination : "${var.datadog_config.agent_configuration.destination}/"
      version     = var.datadog_config.agent_configuration.version
      source      = replace(var.datadog_config.agent_configuration.source, "<ROOT_MODULE_PATH>", path.root)
      files       = var.datadog_config.agent_configuration.files
    }
  })

  datadog_configuration_files_cmd = flatten([
    for file in local.datadog_global_config.agent_configuration.files : [
      "sudo rm ${local.datadog_global_config.agent_configuration.destination}${file}.bak",
      "sudo mv ${local.datadog_global_config.agent_configuration.destination}${file} ${local.datadog_global_config.agent_configuration.destination}${file}.bak",
      "sudo mv /tmp/${file} ${local.datadog_global_config.agent_configuration.destination}${file}"
    ]
  ])

  notification_users_str = join(" ", [for email in var.datadog_config.notification_users : "@${email}"])
}