variable "default_password_length" {
  type        = number
  description = "Default users password length"
  default     = 16
}

variable "users" {
  type = map(object({
    fullname           = optional(string, "Provident User")
    email              = optional(string, "")
    path               = optional(string, "/")
    programatic_access = optional(bool, false)
    console_access     = optional(bool, false)
    enable_mfa         = optional(bool, false)
    groups             = optional(list(string), [])
    validate_on_ses    = optional(bool, false)
    aditional_tags     = optional(map(string), {})
    inline_policy      = optional(any)
    password_length    = optional(number)
  }))
  description = "List of users to be created and managed. Username as map key."
}

variable "groups" {
  type = map(object({
    path           = optional(string, "/")
    inline_policy  = optional(any)
    attach_policy  = optional(string)
    aditional_tags = optional(map(string), {})
  }))
  description = "List of groups to be created and managed. Group name as map key."
}

variable "policies" {
  type = map(object({
    name        = string
    description = optional(string)
    policy_body = any
  }))
  description = "List of policies to be created and managed. Short policy name as map key."
}

variable "roles" {
  type = map(object({
    assume_role_policy = any
    attach_policy      = list(string)
  }))
  description = "List of roles to be created and managed. Role name as map key."
}