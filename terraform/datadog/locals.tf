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
      dd_agent_key         = datadog_api_key.dd_agent_key[v.datadog_agent_key].key
    }) if v.datadog_agent != null ? v.datadog_agent.install : false
  }

  datadog_global_config = merge(var.datadog_config, {
    ssh_private_key_path = replace(var.datadog_config.ssh_private_key_path, "<ROOT_MODULE_PATH>", path.module)
    agent_configuration = {
      destination  = var.datadog_config.agent_configuration.destination
      datadog_yaml = replace(var.datadog_config.agent_configuration.datadog_yaml, "<ROOT_MODULE_PATH>", path.module)
      conf_d       = replace(var.datadog_config.agent_configuration.conf_d, "<ROOT_MODULE_PATH>", path.module)
      check_d      = replace(var.datadog_config.agent_configuration.check_d, "<ROOT_MODULE_PATH>", path.module)
    }
  })

  notification_users_str = join(" ", [for email in var.datadog_config.notification_users : "@${email}"])
}