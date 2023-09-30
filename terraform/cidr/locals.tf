locals {
  first_host     = cidrhost(var.cidr, 0)
  last_host      = cidrhost(var.cidr, -1)
  in_range_check = { for cidr in var.in_range : cidr => cidrhost(cidr, 0) == cidrhost(format("%s/%s", element(split("/", cidr), 0), element(split("/", var.cidr), 1)), 0) }
}