# AWS Route53 Private Record
This module provisions dummy records (A record) in Private Hosted Zone with all its dependencies like
- VPC
- DNS Zone

## Pre-requisites
- Need to create a `provider.tf` with below contents
    ```
    provider "aws" {
      profile = "<profile-name>"
      region  = "<aws-region>"
    }
    ```
- Command to execute the module
  `terraform apply -var-file test.tfvars`
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_vpc"></a> [vpc](#module\_vpc) | terraform-aws-modules/vpc/aws | ~> 5.5.1 |
| <a name="module_dns_zone"></a> [dns\_zone](#module\_dns\_zone) | git::https://github.com/nexient-llc/tf-aws-wrapper_module-dns_zone.git | feature/upgrade |
| <a name="module_dns_record"></a> [dns\_record](#module\_dns\_record) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-module-resource\_name to generate resource names | <pre>map(object({<br>    name       = string<br>    max_length = optional(number, 60)<br>    region     = optional(string, "us-east-2")<br>  }))</pre> | <pre>{<br>  "dns_zone": {<br>    "max_length": 80,<br>    "name": "zone",<br>    "region": "us-east-2"<br>  }<br>}</pre> | no |
| <a name="input_naming_prefix"></a> [naming\_prefix](#input\_naming\_prefix) | Prefix for the provisioned resources. | `string` | `"demo"` | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Project environment | `string` | `"dev"` | no |
| <a name="input_environment_number"></a> [environment\_number](#input\_environment\_number) | The environment count for the respective environment. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_resource_number"></a> [resource\_number](#input\_resource\_number) | The resource count for the respective resource. Defaults to 000. Increments in value of 1 | `string` | `"000"` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region in which the infra needs to be provisioned | `string` | `"us-east-2"` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br>    For example, backend, frontend, middleware etc. | `string` | `"network"` | no |
| <a name="input_vpc_name"></a> [vpc\_name](#input\_vpc\_name) | Name of the VPC to be created | `string` | `"test-vpc-015931995"` | no |
| <a name="input_vpc_cidr"></a> [vpc\_cidr](#input\_vpc\_cidr) | CIDR block for the VPC | `string` | `"10.1.0.0/16"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet cidrs | `list(string)` | <pre>[<br>  "10.1.1.0/24",<br>  "10.1.2.0/24",<br>  "10.1.3.0/24"<br>]</pre> | no |
| <a name="input_availability_zones"></a> [availability\_zones](#input\_availability\_zones) | List of availability zones for the VPC | `list(string)` | <pre>[<br>  "us-east-2a",<br>  "us-east-2b",<br>  "us-east-2c"<br>]</pre> | no |
| <a name="input_zone_name"></a> [zone\_name](#input\_zone\_name) | Name of the Route53 Zone to be created | `string` | n/a | yes |
| <a name="input_comment"></a> [comment](#input\_comment) | Comment to be associated with the Route53 Zone | `string` | `""` | no |
| <a name="input_force_destroy"></a> [force\_destroy](#input\_force\_destroy) | Boolean whether to be able to delete the DNS Zone | `bool` | `true` | no |
| <a name="input_records"></a> [records](#input\_records) | List of DNS records - A, CNAME etc. to be created.<br>  name: name of the record to be created<br>  type: type or record - A, CNAME etc.<br>  ttl: time to live<br>  health\_check\_id: id of the health check<br>  records: IP Addresses, CIDRs or other DNS record names<br>  alias: Alias names for A and CNAME records<br>    Valid `alias` attributes are `name`, `zone_id` and `evaluate_target_health`.<br>    `alias` conflicts with `ttl` and `records` and vice-versa" | <pre>list(object({<br>    name            = string<br>    type            = string<br>    ttl             = optional(number)<br>    health_check_id = optional(string)<br>    records         = optional(list(string))<br>    alias           = map(string)<br>  }))</pre> | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of custom tags to be associated with the cache cluster | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_vpc_id"></a> [vpc\_id](#output\_vpc\_id) | n/a |
| <a name="output_zone_id"></a> [zone\_id](#output\_zone\_id) | n/a |
| <a name="output_record_fqdn"></a> [record\_fqdn](#output\_record\_fqdn) | n/a |
| <a name="output_record_name"></a> [record\_name](#output\_record\_name) | n/a |
| <a name="output_zone_name"></a> [zone\_name](#output\_zone\_name) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
