locals {
  agent_keys_secrets_managed = {
    for k, v in var.agent_keys : k => v if v.store_in_secrets
  }
  sanitized_server_map = {
    for server in var.server_list :
    replace(server.name, regex("[^a-zA-Z0-9]", server.name), "_") => server
  }
  sanitized_database_map = {
    for db in var.cluster_db :
    replace(db.name, regex("[^a-zA-Z0-9]", db.name), "_") => db
  }
  install_datadog_agent_on = {
    for k, v in local.sanitized_server_map : k => merge(v, {
      install_agent_script = replace(var.datadog_config.install_script_base_name, "<VERSION>", v.datadog_agent.version)
      dd_agent_key         = datadog_api_key.dd_agent_key[v.datadog_agent.key].key
      ssh = merge(v.ssh, {
        private_key_path = v.ssh.private_key_path != null ? "${replace(replace(v.ssh.private_key_path, "<SERVER_NAME>", v.name), "<SSH_DEFAULT_KEY_PATH>", local.datadog_global_config.ssh_private_key_path)}" : null
      })
      mkdir_command = flatten([
        for k, v in local.datadog_configuration_files : [
          "mkdir -p /tmp/${v.base_dir}"
        ]
      ])
    }) if v.datadog_agent != null ? v.datadog_agent.install : false
  }
  monitored_dabases = {
    for k, v in local.sanitized_database_map : k => v if v.monitor_replication
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
      templates   = var.datadog_config.agent_configuration.templates
      conf_yaml   = var.datadog_config.agent_configuration.conf_yaml
    }
  })

  datadog_configuration_conf_yamls = {
    for k, v in local.datadog_global_config.agent_configuration.conf_yaml : k => {
      absolute_path = "${local.datadog_global_config.agent_configuration.source}/${v}"
      final_file    = v
      base_dir      = dirname(v)
    }
  }
  datadog_configuration_templates = {
    for k, v in local.datadog_global_config.agent_configuration.templates : k => {
      absolute_path = "${local.datadog_global_config.agent_configuration.source}/${v}"
      final_file    = replace(v, ".tpl", ".yaml")
      base_dir      = dirname(v)
    }
  }
  datadog_configuration_files = merge(local.datadog_configuration_conf_yamls, local.datadog_configuration_templates)
  datadog_configuration_commands = flatten([
    for k, v in local.datadog_configuration_files : [
      "echo 'Copying ${v.final_file}'",
      "sudo rm ${local.datadog_global_config.agent_configuration.destination}${v.final_file}.bak",
      "sudo mv ${local.datadog_global_config.agent_configuration.destination}${v.final_file} ${local.datadog_global_config.agent_configuration.destination}${v.final_file}.bak",
      "sudo mkdir -p ${local.datadog_global_config.agent_configuration.destination}${v.base_dir}",
      "sudo mv /tmp/${v.final_file} ${local.datadog_global_config.agent_configuration.destination}${v.final_file}",
      "sudo chown -R dd-agent:dd-agent ${local.datadog_global_config.agent_configuration.destination}${v.base_dir}",
      "echo '${v.final_file} copied'"
    ]
  ])

  notification_users_str = join(" ", [for email in var.datadog_config.notification_users : "@${email}"])
}
