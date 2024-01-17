// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

//variables required by resource names module
variable "resource_names_map" {
  description = "A map of key to resource_name that will be used by tf-module-resource_name to generate resource names"
  type = map(object({
    name       = string
    max_length = optional(number, 60)
    region     = optional(string, "us-east-2")
  }))

  default = {
    dns_zone = {
      name       = "zone"
      max_length = 80
      region     = "us-east-2"
    }
  }
}

variable "naming_prefix" {
  description = "Prefix for the provisioned resources."
  type        = string
  default     = "demo"
}

variable "environment" {
  description = "Project environment"
  type        = string
  default     = "dev"
}

variable "environment_number" {
  description = "The environment count for the respective environment. Defaults to 000. Increments in value of 1"
  default     = "000"
}

variable "resource_number" {
  description = "The resource count for the respective resource. Defaults to 000. Increments in value of 1"
  default     = "000"
}

variable "region" {
  description = "AWS Region in which the infra needs to be provisioned"
  default     = "us-east-2"
}

variable "logical_product_family" {
  type        = string
  description = <<EOF
    (Required) Name of the product family for which the resource is created.
    Example: org_name, department_name.
  EOF
  nullable    = false

  validation {
    condition     = can(regex("^[_\\-A-Za-z0-9]+$", var.logical_product_family))
    error_message = "The variable must contain letters, numbers, -, _, and .."
  }

  default = "launch"
}

variable "logical_product_service" {
  type        = string
  description = <<EOF
    (Required) Name of the product service for which the resource is created.
    For example, backend, frontend, middleware etc.
  EOF
  nullable    = false

  validation {
    condition     = can(regex("^[_\\-A-Za-z0-9]+$", var.logical_product_service))
    error_message = "The variable must contain letters, numbers, -, _, and .."
  }

  default = "network"
}

## VPC related variables
variable "vpc_name" {
  default = "test-vpc-015931995"
}

variable "vpc_cidr" {
  default = "10.1.0.0/16"
}

variable "private_subnets" {
  description = "List of private subnet cidrs"
  default     = ["10.1.1.0/24", "10.1.2.0/24", "10.1.3.0/24"]
}

variable "availability_zones" {
  description = "List of availability zones for the VPC"
  default     = ["us-east-2a", "us-east-2b", "us-east-2c"]
}

variable "zone_name" {
  description = "Name of the Route53 Zone to be created"
  type        = string
}

variable "comment" {
  description = "Comment to be associated with the Route53 Zone"
  type        = string
  default     = ""
}

variable "force_destroy" {
  description = "Boolean whether to be able to delete the DNS Zone"
  type        = bool
  default     = true
}

## DNS record related variables

variable "records" {
  description = <<EOT
  List of DNS records - A, CNAME etc. to be created.
  name: name of the record to be created
  type: type or record - A, CNAME etc.
  ttl: time to live
  health_check_id: id of the health check
  records: IP Addresses, CIDRs or other DNS record names
  alias: Alias names for A and CNAME records
    Valid `alias` attributes are `name`, `zone_id` and `evaluate_target_health`.
    `alias` conflicts with `ttl` and `records` and vice-versa"
  EOT
  type = list(object({
    name            = string
    type            = string
    ttl             = optional(number)
    health_check_id = optional(string)
    records         = optional(list(string))
    alias           = map(string)
  }))
}

variable "tags" {
  description = "A map of custom tags to be associated with the cache cluster"
  type        = map(string)
  default     = {}
}
