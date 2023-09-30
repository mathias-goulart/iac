resource "aws_internet_gateway" "main_internet_gtw" {
  count  = local.create_internet_gtw ? 1 : 0
  vpc_id = aws_vpc.main_vpc.id
  tags = merge(var.default_tags, {
    Name = "${lower(var.vpc.name)}_internet_gtw"
  })
}

resource "aws_eip" "nat_gtw_eip" {
  count  = local.create_nat_gateway ? 1 : 0
  domain = "vpc"
}

resource "aws_nat_gateway" "main_nat_gateway" {
  count         = local.create_nat_gateway ? 1 : 0
  allocation_id = aws_eip.nat_gtw_eip[0].id
  subnet_id     = aws_subnet.main_subnets[local.internet_facing_subnets[0]].id

  tags = merge(var.default_tags, {
    Name = "${lower(var.vpc.name)}_nat_gtw"
  })

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main_internet_gtw]
}