
module "network" {
  source = "./network"
  providers = {
    aws = aws.ireland
  }

  vpc = {
    main_cidr = "172.16.0.0/23"
    name      = "MathiasDataDog"
    subnets = {
      private = {
        name               = "Private"
        enable_nat_gateway = true
        cidr_override      = "172.16.1.0/24"
      }
      public = {
        name                    = "Public"
        enable_internet_gateway = true
        assign_public_ips       = true
        cidr_override           = "172.16.0.0/25"
      }
      dmz = {
        name          = "DMZ"
        cidr_override = "172.16.0.128/25"
      }
    }
  }

  region = var.pref_region

  default_tags = merge(var.default_tags, {
    "module" = "Network"
  })
}