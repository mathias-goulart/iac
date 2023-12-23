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

  # provisioner "remote-exec" {
  #   when = destroy
  #   inline = [
  #     "sudo apt-get remove datadog-agent -y"
  #   ]
  # }

  triggers = {
    datadog_key   = each.value.dd_agent_key
    datadog_site  = local.datadog_global_config.api_site
    agent_version = each.value.install_agent_script
  }
}

resource "null_resource" "datadog_agent_copy_config" {
  for_each = local.install_datadog_agent_on

  provisioner "remote-exec" {
    inline = each.value.mkdir_command
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_templates.datadog.final_file}"
    content = templatefile(local.datadog_configuration_templates.datadog.absolute_path, {
      dd_agent_api_key  = each.value.dd_agent_key
      dd_agent_api_site = local.datadog_global_config.api_site
      server_name       = lower(each.value.name)
    })
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.apache_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.apache_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.cpu_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.cpu_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.disk_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.disk_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.memory_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.memory_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.network_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.network_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_conf_yamls.systemd_d.final_file}"
    source      = local.datadog_configuration_conf_yamls.systemd_d.absolute_path
  }

  provisioner "file" {
    destination = "/tmp/${local.datadog_configuration_templates.mysql_d.final_file}"
    content = each.value.mysql_monitor != null ? templatefile(local.datadog_configuration_conf_yamls.apache_d.absolute_path, {
      ddagent_database_host     = each.value.mysql_monitor.host
      ddagent_database_port     = each.value.mysql_monitor.port
      ddagent_database_username = each.value.mysql_monitor.username
      ddagent_database_password = each.value.mysql_monitor.password
    }) : ""
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
    installation_id = null_resource.datadog_agent_installation[each.key].id
    source          = local.datadog_global_config.agent_configuration.source
    version         = local.datadog_global_config.agent_configuration.version
  }

  depends_on = [null_resource.datadog_agent_installation]
}

resource "null_resource" "datadog_agent_config_step2" {
  for_each = local.install_datadog_agent_on

  provisioner "remote-exec" {
    when = create
    inline = concat([
      "sudo chown -R dd-agent:dd-agent datadog.yaml check.d conf.d"
      ], local.datadog_configuration_commands, [
      "echo 'Cleaning up temp files'",
      "sudo rm -rf /tmp/conf.d /tmp/check.d /tmp/datadog.yaml",
      "echo 'Restarting agent service'",
      "sudo systemctl restart datadog-agent"
    ])
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
    source  = local.datadog_global_config.agent_configuration.source
    version = local.datadog_global_config.agent_configuration.version
    copy_id = null_resource.datadog_agent_copy_config[each.key].id
  }

  # Now implicit because it is need for the trigger
  #   depends_on = [null_resource.datadog_agent_copy_config]
}