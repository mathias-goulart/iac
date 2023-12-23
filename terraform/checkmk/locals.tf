locals {
  sanitized_server_map = {
    for server in var.server_list :
    replace(server.name, regex("[^a-zA-Z0-9]", server.name), "_") => server
  }
  install_datadog_agent_on = {
    for k, v in local.sanitized_server_map : k => merge(v, {
      ssh = merge(v.ssh, {
        private_key_path = v.ssh.private_key_path != null ? "${replace(replace(v.ssh.private_key_path, "<SERVER_NAME>", v.name), "<SSH_DEFAULT_KEY_PATH>", local.datadog_global_config.ssh_private_key_path)}" : null
      })
    }) if v.datadog_agent != null ? v.datadog_agent.install : false
  }
}