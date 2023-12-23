variable "server_list" {
  description = "List of servers with their SSH credentials"
  type = list(object({
    name = string
    ip   = string
    ssh = optional(object({
      username         = optional(string, "ubuntu")
      password         = optional(string)
      private_key_path = optional(string, "<SSH_DEFAULT_KEY_PATH>/<SERVER_NAME>.pem")
      port             = optional(number, 22)
    }))
  }))
}

variable "checkmk_config" {
  description = "Configuration of Checkmk to install"
  type = object({
    version   = string
    edition   = optional(string, "raw")
    server_ip = string
  })
}