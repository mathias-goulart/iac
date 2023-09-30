<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

No modules.

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cidr"></a> [cidr](#input\_cidr) | The base CIDR | `string` | n/a | yes |
| <a name="input_in_range"></a> [in\_range](#input\_in\_range) | The IP or Range (CIDR) notation to be tested | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_first_host"></a> [first\_host](#output\_first\_host) | n/a |
| <a name="output_in_range"></a> [in\_range](#output\_in\_range) | n/a |
| <a name="output_last_host"></a> [last\_host](#output\_last\_host) | n/a |
<!-- END_TF_DOCS -->