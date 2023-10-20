vpc_name = "test-vpc-015931996"

naming_prefix = "demo2025823"
zone_name     = "demo-test-2025823.demo.com"
force_destroy = true

records = [
  {
    name    = "test1"
    type    = "A"
    ttl     = 300
    records = ["10.0.1.0"]
    alias   = {}
  },
  {
    name    = "test2"
    type    = "A"
    ttl     = 300
    records = ["10.0.2.0"]
    alias   = {}
  }
]
