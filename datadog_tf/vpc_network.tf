resource "aws_vpc" "main_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    "Name" = "${lower(var.customer_name)}-vpc"
  }
}

resource "aws_internet_gateway" "main_vpc_igtw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "${lower(var.customer_name)}-igtw"
  }
}

resource "aws_eip" "main_vpc_nat_eip" {
  domain = "vpc"
}

resource "aws_nat_gateway" "main_vpc_nat_gtw" {
  allocation_id = aws_eip.main_vpc_nat_eip.id
  subnet_id     = aws_subnet.public_subnets["PublicSubnetA"].id

  tags = {
    Name = "${lower(var.customer_name)}-nat-gtw"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
  depends_on = [aws_internet_gateway.main_vpc_igtw]
}

resource "aws_security_group" "public_alb_sg" {
  name   = "${title(var.customer_name)}PublicALB"
  vpc_id = aws_vpc.main_vpc.id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0 #both ports must be 0 (zero) when protocol is ALL (-1)
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [var.vpc_cidr_block]
  }
}

resource "aws_security_group" "private_default_sg" {
  name   = "${title(var.customer_name)}PrivateDefaultSG"
  vpc_id = aws_vpc.main_vpc.id
}

resource "aws_vpc_security_group_ingress_rule" "private_default_ingress_sg_rule" {
  security_group_id            = aws_security_group.private_default_sg.id
  referenced_security_group_id = aws_security_group.private_default_sg.id
  ip_protocol                  = "-1" # when protocol is ALL no need to specify port
}

resource "aws_vpc_security_group_ingress_rule" "private_default_sg_allow_alb" {
  security_group_id            = aws_security_group.private_default_sg.id
  referenced_security_group_id = aws_security_group.public_alb_sg.id
  ip_protocol                  = "-1"
}

resource "aws_vpc_security_group_egress_rule" "private_default_egress_sg_rule" {
  security_group_id            = aws_security_group.private_default_sg.id
  referenced_security_group_id = aws_security_group.private_default_sg.id
  ip_protocol                  = "-1"
}

resource "aws_vpc_security_group_egress_rule" "private_default_egress_allow_internet" {
  security_group_id = aws_security_group.private_default_sg.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "tcp"
  from_port         = 443
  to_port           = 443
}