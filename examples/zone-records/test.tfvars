
records = {
  "launch.nttdata-test3.com" = {
    type    = "A"
    name    = "launch.nttdata-test3.com"
    ttl     = 300
    records = ["75.2.70.75", "99.83.190.102"]
  }
  "www.launch.nttdata-test3.com" = {
    type    = "CNAME"
    name    = "www.launch.nttdata-test3.com"
    ttl     = 300
    records = ["proxy-ssl.webflow.com."]
  }
}
zones = {
  "launch.nttdata-test3.com" = {
    domain_name = "launch.nttdata-test3.com"
    comment     = "Test to create a public hosted zone through terraform"
    tags        = {}
  }
}
