<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | > 5, < 6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | > 5, < 6 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_log_group.vpc_log_flow_group](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_log_group) | resource |
| [aws_eip.nat_gtw_eip](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip) | resource |
| [aws_flow_log.vpc_log_flow](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log) | resource |
| [aws_iam_role.vpc_log_flow_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy.vpc_log_flow_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy) | resource |
| [aws_internet_gateway.main_internet_gtw](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/internet_gateway) | resource |
| [aws_nat_gateway.main_nat_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/nat_gateway) | resource |
| [aws_route_table.main_route_tables](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route_table) | resource |
| [aws_subnet.main_subnets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/subnet) | resource |
| [aws_vpc.main_vpc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc) | resource |
| [aws_vpc_ipv4_cidr_block_association.vpc_secondary_cidr](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc_ipv4_cidr_block_association) | resource |
| [aws_iam_policy_document.vpc_log_flow_assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_iam_policy_document.vpc_log_flow_policy_doc](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_tags"></a> [default\_tags](#input\_default\_tags) | n/a | `map(string)` | <pre>{<br>  "module": "Network"<br>}</pre> | no |
| <a name="input_region"></a> [region](#input\_region) | Set the prefered region | `string` | `"eu-west-1"` | no |
| <a name="input_vpc"></a> [vpc](#input\_vpc) | n/a | <pre>object({<br>    main_cidr            = string<br>    name                 = optional(string, "ProvidentCRM")<br>    secondary_blocks     = optional(list(string), [])<br>    enable_dns_support   = optional(bool, true)<br>    enable_dns_hostnames = optional(bool, true)<br>    enable_vpc_flow_logs = optional(bool, true)<br>    subnets = optional(map(object({<br>      name                       = string<br>      cidr_override              = string<br>      cidr_secondary             = optional(bool, false)<br>      availability_zones         = optional(list(string), ["a", "b"])<br>      use_dedicated_route_tables = optional(bool, false)<br>      enable_nat_gateway         = optional(bool, false)<br>      enable_internet_gateway    = optional(bool, false)<br>      enable_vpn_gateway         = optional(bool, false)<br>      enable_ipv6                = optional(bool, false)<br>      assign_public_ips          = optional(bool, false)<br>      additional_inbound_rules = optional(list(object({<br>        rule_name = optional(string, "")<br>        source    = string<br>        protocol  = string<br>        port = optional(object({<br>          from = number<br>          to   = number<br>          }), {<br>          from = 1<br>          to   = 65535<br>        })<br>      })), [])<br>      additional_outbound_rules = optional(list(object({<br>        rule_name = optional(string, "")<br>        source    = string<br>        protocol  = string<br>        port = optional(object({<br>          from = number<br>          to   = number<br>          }), {<br>          from = 1<br>          to   = 65535<br>        })<br>      })), [])<br>      additional_routes = optional(list(object({<br>        ip_range   = string<br>        gateway_id = string<br>      })), [])<br>      })), {<br>      private = {<br>        name               = "Private"<br>        cidr_override      = ""<br>        enable_nat_gateway = true<br>      },<br>      public = {<br>        name                    = "Public"<br>        cidr_override           = ""<br>        enable_internet_gateway = true<br>      },<br>      dmz = {<br>        name          = "Dmz"<br>        cidr_override = ""<br>      }<br>    })<br><br>  })</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_subnets_map"></a> [subnets\_map](#output\_subnets\_map) | n/a |
<!-- END_TF_DOCS -->