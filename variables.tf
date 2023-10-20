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

variable "zone_name" {
  description = "Name of the Route53 Zone to be created"
  type        = string
  default     = null
}

variable "zone_id" {
  description = "Zone ID of the hosted zone. Conflicts with zone_name"
  type        = string
  default     = null
}

variable "private_zone" {
  description = "Whether the Zone is private or public. Default is private."
  type        = bool
  default     = true
}

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
