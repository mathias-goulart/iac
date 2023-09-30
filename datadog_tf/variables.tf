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
  type    = bool
  default = false
}

variable "enabled_datadog_integration" {
  type    = bool
  default = false
}

variable "datadog_api_key" {
  type      = string
  sensitive = true
}

variable "datadog_app_key" {
  type      = string
  sensitive = true
}

variable "datadog_users" {
  type = map(object({
    name  = optional(string)
    email = optional(string)
  }))
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