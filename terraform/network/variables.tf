variable "vpc" {
  type = object({
    main_cidr            = string
    name                 = optional(string, "ProvidentCRM")
    secondary_blocks     = optional(list(string), [])
    enable_dns_support   = optional(bool, true)
    enable_dns_hostnames = optional(bool, true)
    enable_vpc_flow_logs = optional(bool, true)
    subnets = optional(map(object({
      name                       = string
      cidr_override              = string
      cidr_secondary             = optional(bool, false)
      availability_zones         = optional(list(string), ["a", "b"])
      use_dedicated_route_tables = optional(bool, false)
      enable_nat_gateway         = optional(bool, false)
      enable_internet_gateway    = optional(bool, false)
      enable_vpn_gateway         = optional(bool, false)
      enable_ipv6                = optional(bool, false)
      assign_public_ips          = optional(bool, false)
      additional_inbound_rules = optional(list(object({
        rule_name = optional(string, "")
        source    = string
        protocol  = string
        port = optional(object({
          from = number
          to   = number
          }), {
          from = 1
          to   = 65535
        })
      })), [])
      additional_outbound_rules = optional(list(object({
        rule_name = optional(string, "")
        source    = string
        protocol  = string
        port = optional(object({
          from = number
          to   = number
          }), {
          from = 1
          to   = 65535
        })
      })), [])
      additional_routes = optional(list(object({
        ip_range   = string
        gateway_id = string
      })), [])
      })), {
      private = {
        name               = "Private"
        cidr_override      = ""
        enable_nat_gateway = true
      },
      public = {
        name                    = "Public"
        cidr_override           = ""
        enable_internet_gateway = true
      },
      dmz = {
        name          = "Dmz"
        cidr_override = ""
      }
    })

  })
}

variable "region" {
  type        = string
  default     = "eu-west-1"
  description = "Set the prefered region"
}

variable "default_tags" {
  type = map(string)
  default = {
    "module" = "Network"
  }
}