data "aws_region" "current_region" {}

locals {

  ports = {
    all = {
      from = 0
      to   = 65535
    }
    ephemeral = {
      from = 1024
      to   = 65535
    }
    https = {
      from = 443
      to   = 443
    }
    http = {
      from = 80
      to   = 80
    }
  }

  protocols = {
    all = {
      code = "-1"
      name = "all traffic"
    }
    icmp = {
      code = "1"
      name = "icmp"
    }
    tcp = {
      code = "6"
      name = "tcp"
    }
    udp = {
      code = "17"
      name = "udp"
    }
  }

  fortinet_network = {
    cidr_block  = "10.10.0.0/16"
    vpn_gateway = "tgw-0b18ae4e420f936f9"
  }

  availability_zones = { for az in var.select_availability_zones : "${data.aws_region.current_region.name}${az}" => {
    region      = "${data.aws_region.current_region.name}"
    region_name = "${data.aws_region.current_region.description}"
    az_name     = "${data.aws_region.current_region.name}${az}"
  } }

  private_sub_names = { for az in var.select_availability_zones : "PrivateSubnet${upper(az)}" => {
    az_name = "${data.aws_region.current_region.name}${az}"
  } }
  private_sub_cidrs = {
    "PrivateSubnetA" : cidrsubnet(var.vpc_cidr_block, 2, 0),
    "PrivateSubnetB" : cidrsubnet(var.vpc_cidr_block, 2, 1)
  }

  public_sub_names = { for az in var.select_availability_zones : "PublicSubnet${upper(az)}" => {
    az_name = "${data.aws_region.current_region.name}${az}"
  } }
  public_sub_cidrs = {
    "PublicSubnetA" : cidrsubnet(var.vpc_cidr_block, 2, 2),
    "PublicSubnetB" : cidrsubnet(var.vpc_cidr_block, 2, 3)
  }

  notification_users_str = join(" ", [for k, v in var.datadog_users : "@${v.email}"])

}