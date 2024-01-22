locals {
  zones = {
    "launch.nttdata.com" = {
      domain_name = "launch.nttdata.com"
      comment     = "Test to create a public hosted zone through terraform"
      tags        = {}
    }
  }
  zone_id = module.dns_zone.route53_zone_zone_ids["launch.nttdata.com"]
}
