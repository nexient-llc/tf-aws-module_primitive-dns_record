# AWS Route53 Record
This module provisions a public `route 53` DNS zone along with `A` and `CNAME` record.

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
| <a name="module_dns_zone"></a> [dns\_zone](#module\_dns\_zone) | git::https://github.com/nexient-llc/tf-aws-collection_module-dns_zone.git | 0.1.2 |
| <a name="module_dns_record"></a> [dns\_record](#module\_dns\_record) | ../.. | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_records"></a> [records](#input\_records) | Records and their properties | <pre>map(object({<br>    type            = string<br>    ttl             = optional(number)<br>    name            = string<br>    records         = optional(list(string))<br>    set_identifier  = optional(string)<br>    health_check_id = optional(string)<br>    alias = optional(object({<br>      name                   = string<br>      zone_id                = string<br>      evaluate_target_health = bool<br>    }))<br>    cidr_routing_policy = optional(object({<br>      collection_id = string<br>      location_name = string<br>    }))<br>    failover_routing_policy = optional(object({<br>      type = string<br>    }))<br>    geolocation_routing_policy = optional(object({<br>      continent   = string<br>      country     = string<br>      subdivision = optional(string)<br>    }))<br>    latency_routing_policy = optional(object({<br>      region = string<br>    }))<br>    multivalue_answer_routing_policy = optional(bool)<br>    weighted_routing_policy = optional(object({<br>      weight = number<br>    }))<br>    allow_overwrite = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_create"></a> [create](#input\_create) | Whether to create Route53 zone | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags added to all zones. Will take precedence over tags from the 'zones' variable | `map(string)` | `{}` | no |
| <a name="input_zones"></a> [zones](#input\_zones) | Map of Route53 zone parameters | `map(any)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_record_fqdns"></a> [record\_fqdns](#output\_record\_fqdns) | FQDNs built using the zone domain and name. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
