resource "aws_vpc" "tfer--vpc-00852b5cfd35e5e28" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.31.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"
}

resource "aws_vpc" "tfer--vpc-0d805d930e353f17c" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.145.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "UAT-IE-vpc"
  }

  tags_all = {
    Name = "UAT-IE-vpc"
  }
}

resource "aws_vpc" "tfer--vpc-0ec1b791326300a04" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.16.0.0/24"
  enable_dns_hostnames                 = "false"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "datadogmgtest-vpc"
  }

  tags_all = {
    Name = "datadogmgtest-vpc"
  }
}

resource "aws_vpc" "tfer--vpc-0f38736601ad9a0d2" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.16.4.0/24"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "Web Hosting"
  }

  tags_all = {
    Name = "Web Hosting"
  }
}

resource "aws_vpc" "tfer--vpc-b93339d0" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.16.2.0/24"
  enable_dns_hostnames                 = "false"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "Provident - Prod"
  }

  tags_all = {
    Name = "Provident - Prod"
  }
}

resource "aws_vpc" "tfer--vpc-ce6489ab" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "172.16.10.0/24"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "RDS VPC"
  }

  tags_all = {
    Name = "RDS VPC"
  }
}

resource "aws_vpc" "tfer--vpc-cedf2eab" {
  assign_generated_ipv6_cidr_block     = "false"
  cidr_block                           = "10.245.0.0/16"
  enable_dns_hostnames                 = "true"
  enable_dns_support                   = "true"
  enable_network_address_usage_metrics = "false"
  instance_tenancy                     = "default"
  ipv6_netmask_length                  = "0"

  tags = {
    Name = "Provident - Prod 2"
  }

  tags_all = {
    Name = "Provident - Prod 2"
  }
}
