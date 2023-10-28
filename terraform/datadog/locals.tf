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
      dd_agent_key         = datadog_api_key.dd_agent_key[each.value.datadog_agent_key].key
    }) if v.datadog_agent != null ? v.datadog_agent.install : false
  }

  notification_users_str = join(" ", [for email in var.datadog_config.notification_users : "@${email}"])
}