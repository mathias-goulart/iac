resource "aws_route53_zone" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie" {
  force_destroy = "false"
  name          = "providentcrm.ie"
}

resource "aws_route53_zone" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com" {
  force_destroy = "false"
  name          = "crmireland.com"
}

resource "aws_route53_zone" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com" {
  force_destroy = "false"
  name          = "providentcrm.com"
}

resource "aws_route53_zone" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk" {
  force_destroy = "false"
  name          = "providentcrm.co.uk"
}
