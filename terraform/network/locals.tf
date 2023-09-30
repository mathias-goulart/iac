locals {
  subnet_names = flatten([for k, v in var.vpc.subnets :
  [for az in v.availability_zones : "${lower(k)}_${lower(az)}"]])
  subnet_quantity = length(local.subnet_names)

  cidr_divisor = ceil(log(local.subnet_quantity % 2 == 0 ? local.subnet_quantity : local.subnet_quantity + 1, 2))

  subnets_array = flatten([for k, v in var.vpc.subnets : [
    for az in v.availability_zones : merge({
      internal_name     = "${lower(k)}_${lower(az)}"
      internal_key      = k
      name              = endswith(upper(v.name), "SUBNET") ? "${v.name}${upper(az)}" : "${v.name}Subnet${upper(az)}"
      availability_zone = "${var.region}${az}"
      route_table       = v.use_dedicated_route_tables ? "${title(k)}RouteTable${upper(az)}" : "${title(k)}RouteTable"
      acl_name          = "${title(k)}NetworkACL"
      subnet_cidr       = v.cidr_override != "" ? cidrsubnet(v.cidr_override, ceil(log(length(v.availability_zones) % 2 == 0 ? length(v.availability_zones) : length(v.availability_zones) + 1, 2)), index(v.availability_zones, az)) : cidrsubnet(var.vpc.main_cidr, local.cidr_divisor, index(local.subnet_names, "${lower(k)}_${lower(az)}"))
  }, var.vpc.subnets[k])]])
  subnets_map = {
    for v in local.subnets_array : v.internal_name => v
  }
  internet_facing_subnets = [
    for k, v in local.subnets_map : k if v.enable_internet_gateway
  ]

  route_tables_map = { for k, v in local.subnets_map : v.route_table => merge(v, {
    name   = k
    subnet = v.internal_name
    routes = flatten([
      v.enable_nat_gateway ? [{ ip_range = "0.0.0.0/0", gateway_id = "NAT_GTW" }] : [],
      v.enable_internet_gateway ? [{ ip_range = "0.0.0.0/0", gateway_id = "INTERNET_GTW" }] : [],
      v.enable_vpn_gateway ? [{ ip_range = "0.0.0.0/0", gateway_id = "VPN_GTW" }] : [],
      v.additional_routes
    ])
    })...
  }
  route_tables_route = {
    for k, v in local.route_tables_map : k => distinct(flatten([
      for subnet in v : [
        subnet.routes
      ]
    ]))
  }

  create_nat_gateway  = anytrue(local.subnets_array[*].enable_nat_gateway)
  create_internet_gtw = anytrue(local.subnets_array[*].enable_internet_gateway) || local.create_nat_gateway

}

check "subnet_mask_size" {
  assert {
    condition = alltrue([
      for subnet in local.subnets_array : tonumber(split("/", subnet.subnet_cidr)[1]) >= 16 && tonumber(split("/", subnet.subnet_cidr)[1]) <= 28
    ])
    error_message = "There are subnets bigger than or smaller than the allowed CIDR Range. See https://docs.aws.amazon.com/vpc/latest/userguide/subnet-sizing.html"
  }
}