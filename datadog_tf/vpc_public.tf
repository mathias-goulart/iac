resource "aws_subnet" "public_subnets" {
  for_each          = local.public_sub_names
  vpc_id            = aws_vpc.main_vpc.id
  cidr_block        = local.public_sub_cidrs[each.key]
  availability_zone = each.value.az_name
  tags = {
    Name = "${lower(var.customer_name)}-public-sub-${each.value.az_name}"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main_vpc.id
  tags = {
    "Name" = "${lower(var.customer_name)}-public-routes"
  }
}

resource "aws_route_table_association" "public_route_table_assoc" {
  for_each       = local.public_sub_names
  subnet_id      = aws_subnet.public_subnets[each.key].id
  route_table_id = aws_route_table.public_route_table.id
}

resource "aws_route" "public_route_to_internet" {
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_vpc_igtw.id
  depends_on             = [aws_route_table.public_route_table]
}

resource "aws_route" "public_route_to_fortinet" {
  count                  = var.join_vpc_to_fortinet ? 1 : 0
  route_table_id         = aws_route_table.public_route_table.id
  destination_cidr_block = local.fortinet_network.cidr_block
  transit_gateway_id     = local.fortinet_network.vpn_gateway
  depends_on             = [aws_route_table.public_route_table]
}

resource "aws_network_acl" "public_network_acl" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${lower(var.customer_name)}-public-nalc"
  }
}

resource "aws_network_acl_association" "public_network_acl_assoc" {
  for_each       = local.public_sub_names
  network_acl_id = aws_network_acl.public_network_acl.id
  subnet_id      = aws_subnet.public_subnets[each.key].id
}

resource "aws_network_acl_rule" "public_network_acl_allow_ingress" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  egress         = false
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_egress" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 100
  egress         = true
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = aws_vpc.main_vpc.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_fortinet_ingress" {
  count          = var.join_vpc_to_fortinet ? 1 : 0
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 101
  egress         = false
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = local.fortinet_network.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_fortinet_egress" {
  count          = var.join_vpc_to_fortinet ? 1 : 0
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 101
  egress         = true
  protocol       = local.protocols.all.code
  rule_action    = "allow"
  cidr_block     = local.fortinet_network.cidr_block
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_internet_ingress_https" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 200
  egress         = false
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.https.from
  to_port        = local.ports.https.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_internet_ingress_http" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 201
  egress         = false
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.http.from
  to_port        = local.ports.http.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_internet_ingress_ephe" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 202
  egress         = false
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.ephemeral.from
  to_port        = local.ports.ephemeral.to
}

resource "aws_network_acl_rule" "public_network_acl_allow_internet_egress" {
  network_acl_id = aws_network_acl.public_network_acl.id
  rule_number    = 200
  egress         = true
  protocol       = local.protocols.tcp.code
  rule_action    = "allow"
  cidr_block     = "0.0.0.0/0"
  from_port      = local.ports.all.from
  to_port        = local.ports.all.to
}