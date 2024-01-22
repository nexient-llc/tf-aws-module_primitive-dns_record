
records = {
  "launch.nttdata.com" = {
    type    = "A"
    name    = "launch.nttdata.com"
    ttl     = 300
    records = ["75.2.70.75", "99.83.190.102"]
  }
  "www.launch.nttdata.com" = {
    type    = "CNAME"
    name    = "www.launch.nttdata.com"
    ttl     = 300
    records = ["proxy-ssl.webflow.com."]
  }
}
zones = {
  "launch.nttdata.com" = {
    domain_name = "launch.nttdata.com"
    comment     = "Test to create a public hosted zone through terraform"
    tags        = {}
  }
}
