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
      destination  = string
      datadog_yaml = string
      conf_d       = string
      check_d      = string
      }), {
      destination  = "/etc/datadog-agent/"
      datadog_yaml = "<ROOT_MODULE_PATH>/datadog.yaml"
      conf_d       = "<ROOT_MODULE_PATH>/conf.d/"
      check_d      = "<ROOT_MODULE_PATH>/check.d/"
    })
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
    datadog_agent = optional(object({
      key     = string
      install = optional(bool, true)
      version = optional(string, "7")
    }))
    ssh = optional(object({
      username         = optional(string, "ubuntu")
      password         = optional(string)
      private_key_path = optional(string)
      port             = optional(number, 22)
    }))
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