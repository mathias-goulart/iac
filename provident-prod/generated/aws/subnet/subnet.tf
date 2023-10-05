resource "aws_subnet" "tfer--subnet-013163113dad3e38d" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.145.128.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "UAT-IE-subnet-private1-eu-west-1a"
  }

  tags_all = {
    Name = "UAT-IE-subnet-private1-eu-west-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0d805d930e353f17c_id}"
}

resource "aws_subnet" "tfer--subnet-023f35106f897a07e" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.0.64/26"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "datadogmgtest-private-sub-eu-west-1b"
  }

  tags_all = {
    Name = "datadogmgtest-private-sub-eu-west-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0ec1b791326300a04_id}"
}

resource "aws_subnet" "tfer--subnet-025d44fc7639922ce" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.32.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-00852b5cfd35e5e28_id}"
}

resource "aws_subnet" "tfer--subnet-0446fa6d8bec8b785" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.0.0/26"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "datadogmgtest-private-sub-eu-west-1a"
  }

  tags_all = {
    Name = "datadogmgtest-private-sub-eu-west-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0ec1b791326300a04_id}"
}

resource "aws_subnet" "tfer--subnet-056801e4fbb080910" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.0.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-00852b5cfd35e5e28_id}"
}

resource "aws_subnet" "tfer--subnet-0670f078a721cc5e4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.0.128/26"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "datadogmgtest-public-sub-eu-west-1a"
  }

  tags_all = {
    Name = "datadogmgtest-public-sub-eu-west-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0ec1b791326300a04_id}"
}

resource "aws_subnet" "tfer--subnet-0739050b8682a56ff" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.31.16.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "true"
  private_dns_hostname_type_on_launch            = "ip-name"
  vpc_id                                         = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-00852b5cfd35e5e28_id}"
}

resource "aws_subnet" "tfer--subnet-08f3dde284b8f510b" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.145.0.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "UAT-IE-subnet-public1-eu-west-1a"
  }

  tags_all = {
    Name = "UAT-IE-subnet-public1-eu-west-1a"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0d805d930e353f17c_id}"
}

resource "aws_subnet" "tfer--subnet-0b3713d4e2c6642e4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.4.0/26"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Web Hosting A"
  }

  tags_all = {
    Name = "Web Hosting A"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0f38736601ad9a0d2_id}"
}

resource "aws_subnet" "tfer--subnet-0b8798b64c0afa10d" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.145.16.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "UAT-IE-subnet-public2-eu-west-1b"
  }

  tags_all = {
    Name = "UAT-IE-subnet-public2-eu-west-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0d805d930e353f17c_id}"
}

resource "aws_subnet" "tfer--subnet-0de027d64403ed8ed" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.0.192/26"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "datadogmgtest-public-sub-eu-west-1b"
  }

  tags_all = {
    Name = "datadogmgtest-public-sub-eu-west-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0ec1b791326300a04_id}"
}

resource "aws_subnet" "tfer--subnet-0f6f42218634b4955" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.145.144.0/20"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "UAT-IE-subnet-private2-eu-west-1b"
  }

  tags_all = {
    Name = "UAT-IE-subnet-private2-eu-west-1b"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-0d805d930e353f17c_id}"
}

resource "aws_subnet" "tfer--subnet-4cf02029" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.245.11.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Provident - Prod 2 A"
  }

  tags_all = {
    Name = "Provident - Prod 2 A"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-cedf2eab_id}"
}

resource "aws_subnet" "tfer--subnet-acfaffea" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.10.144/28"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "RDS VPC C"
  }

  tags_all = {
    Name = "RDS VPC C"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-ce6489ab_id}"
}

resource "aws_subnet" "tfer--subnet-bc3339d5" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.2.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Provident-Prod"
  }

  tags_all = {
    Name = "Provident-Prod"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-b93339d0_id}"
}

resource "aws_subnet" "tfer--subnet-c89f78bf" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.10.128/28"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "RDS VPC B"
  }

  tags_all = {
    Name = "RDS VPC B"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-ce6489ab_id}"
}

resource "aws_subnet" "tfer--subnet-d152aab4" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "172.16.10.0/25"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "RDS VPC A"
  }

  tags_all = {
    Name = "RDS VPC A"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-ce6489ab_id}"
}

resource "aws_subnet" "tfer--subnet-e77865a1" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.245.13.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Provident - Prod 2 C"
  }

  tags_all = {
    Name = "Provident - Prod 2 C"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-cedf2eab_id}"
}

resource "aws_subnet" "tfer--subnet-fdc23d8a" {
  assign_ipv6_address_on_creation                = "false"
  cidr_block                                     = "10.245.12.0/24"
  enable_dns64                                   = "false"
  enable_lni_at_device_index                     = "0"
  enable_resource_name_dns_a_record_on_launch    = "false"
  enable_resource_name_dns_aaaa_record_on_launch = "false"
  ipv6_native                                    = "false"
  map_customer_owned_ip_on_launch                = "false"
  map_public_ip_on_launch                        = "false"
  private_dns_hostname_type_on_launch            = "ip-name"

  tags = {
    Name = "Provident - Prod 2 B"
  }

  tags_all = {
    Name = "Provident - Prod 2 B"
  }

  vpc_id = "${data.terraform_remote_state.vpc.outputs.aws_vpc_tfer--vpc-cedf2eab_id}"
}
