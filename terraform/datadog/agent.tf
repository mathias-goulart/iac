check "ssh_defined_install_agent" {
  assert {
    condition = alltrue([
      for k, v in local.install_datadog_agent_on : v.ssh != null
    ])
    error_message = "When install_datadog_agent is set to TRUE, please define SSH settings"
  }
}

data "local_file" "datadog_yaml" {
  filename = "${local.datadog_global_config.agent_configuration.source}/datadog.yaml"
}

data "local_file" "mysqld_config" {
  filename = "${local.datadog_global_config.agent_configuration.source}/conf.d/mysql.d/config.yaml"
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
    source      = "${local.datadog_global_config.agent_configuration.source}/conf.d/apache.d/conf.yaml"
    destination = "/tmp/conf.d/apache.d/conf.yaml"
  }

  provisioner "file" {
    source      = "${local.datadog_global_config.agent_configuration.source}/conf.d/disk.d/conf.yaml"
    destination = "/tmp/conf.d/disk.d/conf.yaml"
  }

  provisioner "file" {
    destination = "/tmp/conf.d/mysql.d/conf.yaml"
    content = each.value.mysql_monitor != null ? replace(
      replace(
        replace(
          replace(data.local_file.mysqld_config.content, "DDAGENT_DATABASE_HOST", each.value.mysql_monitor.host),
          "DDAGENT_DATABASE_USERNAME", each.value.mysql_monitor.username
        ), "DDAGENT_DATABASE_PASSWORD", each.value.mysql_monitor.password
      ), "DDAGENT_DATABASE_PORT", each.value.mysql_monitor.port
    ) : ""
  }

  provisioner "file" {
    destination = "/tmp/datadog.yaml"
    content = replace(
      replace(data.local_file.datadog_yaml.content, "DD_AGENT_API_KEY", each.value.dd_agent_key),
    "DD_AGENT_API_SITE", local.datadog_global_config.api_site)
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
  }

  depends_on = [null_resource.datadog_agent_installation]
}

resource "null_resource" "datadog_agent_config_step2" {
  for_each = local.install_datadog_agent_on

  provisioner "remote-exec" {
    when = create
    inline = [
      "echo 'Creating backup of the previous configuration'",
      "cd ${local.datadog_global_config.agent_configuration.destination}",
      "sudo rm *.bak",
      "sudo mv datadog.yaml datadog.yaml.bak",
      "sudo rm conf.d/apache.d/conf.yaml.bak",
      "sudo mv conf.d/apache.d/conf.yaml conf.d/apache.d.bak",
      "sudo mv conf.d/disk.d conf.d/disk.d.bak",
      "echo 'Moving new configuration'",
      "cd /tmp",
      "sudo chown -R dd-agent:dd-agent datadog.yaml check.d conf.d",
      "sudo mv /tmp/datadog.yaml ${local.datadog_global_config.agent_configuration.destination}/",
      "sudo mv /tmp/conf.d/apache.d ${local.datadog_global_config.agent_configuration.destination}/conf.d/apache.d",
      "sudo mv /tmp/conf.d/disk.d ${local.datadog_global_config.agent_configuration.destination}/conf.d/disk.d",
      "echo 'Restarting agent service'",
      "sudo systemctl restart datadog-agent"
    ]

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