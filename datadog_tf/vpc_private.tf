resource "aws_subnet" "private_subnets" {
  for_each                = local.private_sub_names
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = local.private_sub_cidrs[each.key]
  availability_zone       = each.value.az_name
  map_public_ip_on_launch = false
  tags = {
    Name = "${lower(var.customer_name)}-private-sub-${each.value.az_name}"
  }
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    "Name" = "${lower(var.customer_name)}-private-routes"
  }
}

resource "aws_route_table_association" "private_route_table_assoc" {
  for_each       = local.private_sub_names
  subnet_id      = aws_subnet.private_subnets[each.key].id
  route_table_id = aws_route_table.private_route_table.id
}

resource "aws_route" "private_route_to_internet" {
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.main_vpc_nat_gtw.id
  depends_on             = [aws_route_table.private_route_table]
}

resource "aws_route" "private_route_to_fortinet" {
  count                  = var.join_vpc_to_fortinet ? 1 : 0
  route_table_id         = aws_route_table.private_route_table.id
  destination_cidr_block = local.fortinet_network.cidr_block
  transit_gateway_id     = local.fortinet_network.vpn_gateway
  depends_on             = [aws_route_table.private_route_table]
}

resource "aws_network_acl" "private_network_acl" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${lower(var.customer_name)}-private-nalc"
  }
}

resource "aws_network_acl_association" "private_network_acl_assoc" {
  for_each       = local.private_sub_names
  network_acl_id = aws_network_acl.private_network_acl.id
  subnet_id      = aws_subnet.private_subnets[each.key].id
}

resource "aws_network_acl_rule" "private_network_acl_allow_ingress" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_egress" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 100
  egress         = true
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_fortinet_ingress" {
  count          = var.join_vpc_to_fortinet ? 1 : 0
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 101
  egress         = false
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = local.fortinet_network.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_fortinet_egress" {
  count          = var.join_vpc_to_fortinet ? 1 : 0
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 101
  egress         = true
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = local.fortinet_network.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_internet_egress_https" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 200
  egress         = true
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.https.from
  to_port        = local.ports.https.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_internet_egress_http" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 201
  egress         = true
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.http.from
  to_port        = local.ports.http.to
}

resource "aws_network_acl_rule" "private_network_acl_allow_internet_ingress" {
  network_acl_id = aws_network_acl.private_network_acl.id
  rule_number    = 200
  egress         = false
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.ephemeral.from
  to_port        = local.ports.ephemeral.to
}