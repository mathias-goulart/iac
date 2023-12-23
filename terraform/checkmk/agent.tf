data "template_file" "checkmk_agent_config" {
  template = file("${path.root}/checkmk/agent_config.tpl")
  vars = {
    checkmk_server_ip = var.checkmk_config.server_ip
  }
}

resource "null_resource" "datadog_agent_installation" {
  for_each = local.install_datadog_agent_on

  triggers = {
    checkmk_version = var.checkmk_config.version
  }

  connection {
    type        = "ssh"
    host        = each.value.ip
    user        = each.value.ssh.username
    private_key = each.value.ssh.private_key
  }

  provisioner "remote-exec" {
    inline = [
      # Install Checkmk agent
      "sudo apt-get update",
      "sudo apt-get install -y check-mk-agent xinetd",
      # Deploy the configuration file
      "echo '${data.template_file.checkmk_agent_config.rendered}' | sudo tee /etc/xinetd.d/check_mk",
      "sudo service xinetd restart",
      # Any additional configuration steps go here
    ]
  }

}