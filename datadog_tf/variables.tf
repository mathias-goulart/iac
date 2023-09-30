variable "vpc_cidr_block" {
  type        = string
  description = "Main CIDR Block to be used by VPC"
}

variable "customer_name" {
  type        = string
  description = "Name that identifies this installation"
}

variable "select_availability_zones" {
  type        = list(string)
  description = "List of selected availability zones"
  default     = ["a", "b"]
}

variable "key_pwd" {
  type      = string
  sensitive = true
  validation {
    condition     = var.key_pwd != ""
    error_message = "Key passphrase can not be empty"
  }
}

variable "join_vpc_to_fortinet" {
  type        = bool
  default     = false
  description = "Whether or not this VPC should join the Fortinet Network"
}

variable "enabled_datadog_integration" {
  type        = bool
  default     = false
  description = "Whether or not this AWS Account should have Datadog integration enabled"
}

variable "datadog_api_key" {
  type        = string
  sensitive   = true
  description = "The Datadog API Key"
}

variable "datadog_app_key" {
  type        = string
  sensitive   = true
  description = "The Datadog APP Key"
}

variable "datadog_users" {
  type = map(object({
    name  = optional(string)
    email = optional(string)
  }))
  description = "The Datadog users and respective emails to be notified about alarms"
  default = {
    "ivan" = {
      email = "ivan@providentcrm.com"
    }
    "andrei" = {
      email = "andrei.copacel@providentcrm.com"
    }
    "mathias" = {
      email = "mathias.goulart@providentcrm.com"
    }
  }
}