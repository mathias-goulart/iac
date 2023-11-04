variable "datadog_config" {
  type = object({
    api_site                 = optional(string, "datadoghq.eu")
    environment              = optional(string, "prod")
    install_script_base_name = optional(string, "install_script_agent<VERSION>.sh")
    notification_users = optional(list(string), [
      "andrei.copacel@providentcrm.com",
      "mathias.goulart@providentcrm.com"
    ])
    ssh_private_key_path = optional(string, "<ROOT_MODULE_PATH>/ssh_keys")
    agent_configuration = optional(object({
      destination = string
      source      = string
      version     = string
      templates   = map(string)
      conf_yaml   = map(string)
      }), {
      destination = "/etc/datadog-agent/"
      source      = "<ROOT_MODULE_PATH>/dd_agent/"
      version     = "7.0.0"
      templates = {
        datadog = "datadog.tpl",
        mysql_d = "conf.d/mysql.d/conf.tpl",
      }
      conf_yaml = {
        apache_d  = "conf.d/apache.d/conf.yaml",
        cpu_d     = "conf.d/cpu.d/conf.yaml",
        disk_d    = "conf.d/disk.d/conf.yaml",
        memory_d  = "conf.d/memory.d/conf.yaml",
        network_d = "conf.d/network.d/conf.yaml",
        systemd_d = "conf.d/systemd.d/conf.yaml"
      }
    })
    monitors = optional(object({
      warning  = optional(number, 75)
      critical = optional(number, 85)
    }), {})
  })
  description = "Datadog global configuration object."
}


variable "aws_integration" {
  type = object({
    enabled     = optional(bool, true)
    account_id  = string
    role_name   = optional(string, "DatadogAWSIntegrationRole")
    policy_name = optional(string, "DatadogAWSIntegrationPolicy")
  })
}

variable "server_list" {
  type = list(object({
    name       = string
    private_ip = string
    alias      = optional(string)
    datadog_agent = optional(object({
      key     = string
      install = optional(bool, true)
      version = optional(string, "7")
    }))
    ssh = optional(object({
      username         = optional(string, "ubuntu")
      password         = optional(string)
      private_key_path = optional(string, "<SSH_DEFAULT_KEY_PATH>/<SERVER_NAME>.pem")
      port             = optional(number, 22)
    }))
    mysql_monitor = optional(object({
      host     = string
      port     = optional(number, 3306)
      username = string
      password = string
    }))
    disk_monitor = optional(list(string), [
      "/web_data", "/databases", "/", "/logging"
    ])
  }))
}

variable "agent_keys" {
  type = map(object({
    store_in_secrets = optional(bool, false)
    secrets_name     = optional(string)
  }))
  description = "Create API keys for the Datadog Agent. Key name as Map Key"
  default     = {}
}