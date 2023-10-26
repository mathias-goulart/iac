variable "repos" {
  type = map(object({
    permission       = optional(string, "private")
    scan_on_push     = optional(bool, false)
    tag_immutability = optional(bool, false)
  }))
  description = "List of Container Repositories to be created"
}

variable "replication" {
  type = map(object({
    enabled       = optional(bool, true)
    destination   = set(string)
    registry_id   = optional(string, "provident")
    filter_by_key = optional(bool, false)
  }))
  description = "Repication rules. Use filter as map key"
  default = {
    "all" = {
      enabled     = false
      destination = []
    }
  }
}