resource "aws_ec2_transit_gateway_vpc_attachment" "fortinet_tgw_attachment" {
  count              = var.join_vpc_to_fortinet ? 1 : 0
  subnet_ids         = [for sub in aws_subnet.private_subnets : sub.id]
  transit_gateway_id = local.fortinet_network.vpn_gateway
  vpc_id             = aws_vpc.main_vpc.id
  depends_on         = [aws_subnet.private_subnets]
}