resource "aws_subnet" "main_subnets" {
  for_each                = local.subnets_map
  vpc_id                  = each.value.cidr_secondary ? aws_vpc_ipv4_cidr_block_association.vpc_secondary_cidr[var.vpc.secondary_blocks[0]].vpc_id : aws_vpc.main_vpc.id
  cidr_block              = each.value.subnet_cidr
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = each.value.assign_public_ips
  tags                    = var.default_tags
}

resource "aws_route_table" "main_route_tables" {
  for_each = local.route_tables_route
  vpc_id   = aws_vpc.main_vpc.id

  dynamic "route" {
    for_each = each.value
    content {
      cidr_block     = route.value.ip_range
      gateway_id     = route.value.gateway_id == "INTERNET_GTW" ? aws_internet_gateway.main_internet_gtw[0].id : ""
      nat_gateway_id = route.value.gateway_id == "NAT_GTW" ? aws_nat_gateway.main_nat_gateway[0].id : ""
      # vpn_gateway = route.gateway_id == "VPN_GTW" ? 
    }
  }

  tags = merge({
    Name = each.key
  }, var.default_tags)

}
