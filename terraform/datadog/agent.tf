check "ssh_defined_install_agent" {
  assert {
    condition = alltrue([
      for k, v in local.install_datadog_agent_on : v.ssh != null
    ])
    error_message = "When install_datadog_agent is set to TRUE, please define SSH settings"
  }
}


resource "null_resource" "datadog_agent_installation" {
  for_each = local.install_datadog_agent_on

  provisioner "remote-exec" {
    when = create
    inline = [
      "DD_API_KEY=${each.value.dd_agent_key} DD_SITE=\"${var.datadog_config.api_site}\" DD_ENV=${var.datadog_config.environment} bash -c \"$(curl -L https://s3.amazonaws.com/dd-agent/scripts/${each.value.install_agent_script})\""
    ]

    connection {
      type        = "ssh"
      host        = each.value.private_ip
      user        = each.value.ssh.username
      private_key = each.value.ssh.private_key_path != null ? file(each.value.ssh.private_key_path) : null
      password    = each.value.ssh.password
      port        = each.value.ssh.port
    }
  }

  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo apt-get remove datadog-agent -y"
    ]
  }

  triggers = {
    datadog_key   = each.value.dd_agent_key
    datadog_site  = var.datadog_config.api_site
    agent_version = each.value.install_agent_script
  }
}

resource "null_resource" "datadog_agent_configuration" {
  for_each = local.install_datadog_agent_on

  provisioner "file" {
    source      = local.datadog_global_config.agent_configuration.datadog_yaml
    destination = local.datadog_global_config.agent_configuration.destination
  }

  provisioner "file" {
    source      = local.datadog_global_config.agent_configuration.conf_d
    destination = local.datadog_global_config.agent_configuration.destination
  }

  provisioner "file" {
    source      = local.datadog_global_config.agent_configuration.check_d
    destination = local.datadog_global_config.agent_configuration.destination
  }

  connection {
    type        = "ssh"
    host        = each.value.private_ip
    user        = each.value.ssh.username
    private_key = each.value.ssh.private_key_path != null ? file(each.value.ssh.private_key_path) : null
    password    = each.value.ssh.password
    port        = each.value.ssh.port
  }

  triggers = {
    datadog_yaml = var.datadog_config.agent_configuration.datadog_yaml
    conf_d       = var.datadog_config.agent_configuration.conf_d
    check_d      = var.datadog_config.agent_configuration.check_d
  }

  depends_on = [null_resource.datadog_agent_installation]
}