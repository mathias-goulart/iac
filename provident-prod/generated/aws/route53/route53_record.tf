resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.ie"
  records                          = ["54.155.23.123"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.ie"
  records                          = ["10 ASPMX.L.GOOGLE.COM", "20 ALT1.ASPMX.L.GOOGLE.COM", "20 ALT2.ASPMX.L.GOOGLE.COM", "30 ASPMX2.GOOGLEMAIL.COM", "30 ASPMX3.GOOGLEMAIL.COM", "30 ASPMX4.GOOGLEMAIL.COM", "30 ASPMX5.GOOGLEMAIL.COM"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.ie"
  records                          = ["ns-1155.awsdns-16.org.", "ns-1617.awsdns-10.co.uk.", "ns-432.awsdns-54.com.", "ns-585.awsdns-09.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.ie"
  records                          = ["ns-1155.awsdns-16.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.ie"
  records                          = ["v=spf1 mx a:ebarrier.providentit.com a:ebarrier1.providentit.com a:mail.marketing.providentit.com include:_spf.google.com include:amazonses.com include:spf.protection.outlook.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_selector1-002E-_domainkey-002E-providentcrm-002E-ie-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector1._domainkey.providentcrm.ie"
  records                          = ["selector1-providentcrm-ie._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_selector2-002E-_domainkey-002E-providentcrm-002E-ie-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector2._domainkey.providentcrm.ie"
  records                          = ["selector2-providentcrm-ie._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z00873072DF3YA37EZMII_www-002E-providentcrm-002E-ie-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.providentcrm.ie"
  records                          = ["providentcrm.ie"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z00873072DF3YA37EZMII_providentcrm-002E-ie.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_autodiscover-002E-crmireland-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "autodiscover.crmireland.com"
  records                          = ["autodiscover.outlook.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crmireland.com"
  records                          = ["54.155.23.123"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crmireland.com"
  records                          = ["10 crmireland-com.mail.protection.outlook.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crmireland.com"
  records                          = ["ns-1152.awsdns-16.org.", "ns-1877.awsdns-42.co.uk.", "ns-480.awsdns-60.com.", "ns-830.awsdns-39.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crmireland.com"
  records                          = ["ns-1877.awsdns-42.co.uk. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crmireland.com"
  records                          = ["v=spf1 mx a:ebarrier.providentit.com include:spf.protection.outlook.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_google-002E-_domainkey-002E-crmireland-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "google._domainkey.crmireland.com"
  records                          = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs1gUL/\" \"EtnYF8jkVPRxe9YBNieg3TFGKJ9BT76Q7SFGWQ6BsGbRX2lbS9iZa287zQaD2kMWD0ztuP2IGbb1tWx6ASThRytnspjEc/Svde9AdeLlWYQmM57GXB9I0CUBz8Z/5XhkPN77vcO3H/UTPY3M0tAHwVKaOir+X6bNtRbqbGsuJG6PKTyg6oWbEIsBLXMVTEVoHorkQ/\"\"e81Yj5J6Zv+/6tWb1iAZTOUv8Z7XOlBUWj/31M1w9pGUwp5z2bJDJl8HuwF9r9b++mvKjWc1OQ6TTiDO3Vmbt0O7Rb3fvMd97+tf6EzzUt+PX+C/AmZDnTWNTlkjs8CKm8a30q7DMwIDAQAB"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_googlececad2bc34c52915-002E-crmireland-002E-com-002E-crmireland-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "googlececad2bc34c52915.crmireland.com.crmireland.com"
  records                          = ["google.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_selector1-002E-_domainkey-002E-crmireland-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector1._domainkey.crmireland.com"
  records                          = ["selector1-crmireland-com._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_selector2-002E-_domainkey-002E-crmireland-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector2._domainkey.crmireland.com"
  records                          = ["selector2-crmireland-com._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--Z1EDZCV7VXZKQ9_www-002E-crmireland-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.crmireland.com"
  records                          = ["crmireland.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--Z1EDZCV7VXZKQ9_crmireland-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_-002A--002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "*.providentcrm.com"
  records                          = ["54.246.147.151"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_5ttn4tadb2mmkmjxdsoi2rjjfjqpwipj-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "5ttn4tadb2mmkmjxdsoi2rjjfjqpwipj._domainkey.providentcrm.com"
  records                          = ["5ttn4tadb2mmkmjxdsoi2rjjfjqpwipj.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2__amazonchime-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_amazonchime.providentcrm.com"
  records                          = ["95bcd59c-f775-4066-a329-726ade112482"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2__amazonses-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_amazonses.providentcrm.com"
  records                          = ["BsxATTHjnOIKXlLh3Q+g6fw8VBBUsCzZui9NU0Kb+LE="]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2__dmarc-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_dmarc.providentcrm.com"
  records                          = ["v=DMARC1; p=quarantine; pct=90; sp=none"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2__domainkey-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "_domainkey.providentcrm.com"
  records                          = ["t=y;o=~;"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_acton-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "acton.providentcrm.com"
  records                          = ["providentcrm.actonservice.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_adobesign-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "adobesign.providentcrm.com"
  records                          = ["foxnetworx-gijon.duckdns.org"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_amber-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "amber.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_aqmetrics-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "aqmetrics.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_autodiscover-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "autodiscover.providentcrm.com"
  records                          = ["autodiscover.outlook.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_avt-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "avt.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_balcombes-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "balcombes.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_balcombesportal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "balcombesportal.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bch-demo-portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bch-demo-portal.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bch-portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bch-portal.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bch-portalsbx-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bch-portalsbx.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bcmstraining-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bcmstraining.providentcrm.com"
  records                          = ["89.101.248.146"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bcmstraining-api-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bcmstraining-api.providentcrm.com"
  records                          = ["89.101.248.146"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bespoke-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bespoke.providentcrm.com"
  records                          = ["providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_bespoke-alfresco-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "bespoke-alfresco.providentcrm.com"
  records                          = ["54.76.114.12"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_blockangel-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "blockangel.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_blog-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "blog.providentcrm.com"
  records                          = ["6638984.group34.sites.hubspot.net"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_capstone-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "capstone.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_chwv-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "chwv.providentcrm.com"
  records                          = ["54.229.61.215"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_chwvsandbox-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "chwvsandbox.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_citylearning-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "citylearning.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_cluster01-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "cluster01.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_colt-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "colt.providentcrm.com"
  records                          = ["prd-elb-vpc02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_colt-uat-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "colt-uat.providentcrm.com"
  records                          = ["54.246.239.170"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_coltapi-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "coltapi.providentcrm.com"
  records                          = ["web9.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_copperfasten-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "copperfasten.providentcrm.com"
  records                          = ["prd-elb-vpc02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_creditexchange-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "creditexchange.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_crosscare-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "crosscare.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_cti1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "cti1.providentcrm.com"
  records                          = ["52.49.25.72"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dan-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dan.providentcrm.com"
  records                          = ["54.246.141.255"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dan1-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dan1.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_danuat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "danuat.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dcab-signup-uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dcab-signup-uat.providentcrm.com"
  records                          = ["dcab-sugar-uat.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dcab-sugar-uat-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dcab-sugar-uat.providentcrm.com"
  records                          = ["13.41.142.247"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dcab-survey-uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dcab-survey-uat.providentcrm.com"
  records                          = ["dcab-sugar-uat.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_demo-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "demo.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_demo_test-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "demo_test.providentcrm.com"
  records                          = ["dmz5.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dessian-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dessian.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_digoc1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "digoc1.providentcrm.com"
  records                          = ["198.199.124.156"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dmz1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dmz1.providentcrm.com"
  records                          = ["89.101.248.153"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dmz2-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dmz2.providentcrm.com"
  records                          = ["89.101.248.154"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dmz4-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dmz4.providentcrm.com"
  records                          = ["89.101.248.156"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dmz7-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dmz7.providentcrm.com"
  records                          = ["89.100.100.164"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dr5-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dr5.providentcrm.com"
  records                          = ["89.101.248.155"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_drhe-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "drhe.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_drupal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "drupal.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_drupal-bcmstraining-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "drupal-bcmstraining.providentcrm.com"
  records                          = ["89.101.248.151"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_dualtron-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "dualtron.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_easydry-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "easydry.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_elk-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "elk.providentcrm.com"
  records                          = ["212.126.35.164"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_email-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "email.providentcrm.com"
  records                          = ["6638984.group34.sites.hubspot.net"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_eurocarparks-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "eurocarparks.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_evault1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "evault1.providentcrm.com"
  records                          = ["54.220.31.128"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fdc-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fdc.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_portal.providentcrm.com"
  records                          = ["web3.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uat.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uat12-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uat12.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uat3ds-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uat3ds.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uat3dsnode-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uat3dsnode.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uatnode-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uatnode.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fg_uatnode12-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fg_uatnode12.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_finegael-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "finegael.providentcrm.com"
  records                          = ["web3.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_finegael_portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "finegael_portal.providentcrm.com"
  records                          = ["web3.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_forms-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "forms.providentcrm.com"
  records                          = ["eu.hostssl.msgapp.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_ftp-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ftp.providentcrm.com"
  records                          = ["dmz4.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_fulbright-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "fulbright.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_gdl-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "gdl.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_google-002E-_domainkey-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "google._domainkey.providentcrm.com"
  records                          = ["v=DKIM1; k=rsa; p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAhlR9r/kBaHOnuud4EdYFx7aCh2ntLr98Ym3GmkM+MvfowKyFQbnln85h1Aa4NpSD7FAolAzZkLQPYfJlkOj3CDOPNKHL1A9ktULWq93f8fbNN/HPmf2/qZZ0Z6k33nRip4SuBjWtRKVfU/TdMfNp7Pw//0oEqLN/\" \"MxhPk5dsRVFDsiAs4XIaHTRNrLGjS9WipeDeS3N+WdVjgfjgUukBWUYUnb3pphCLQJJPPjPSFkf5d70BS/+agX13VcDcAznPI/ky3/Dtq8jpIigFKmxzwcSFnFe4MleHklS/Ljll5CNlGNlYuj+6cmWtmwQeVT+QcuGIFHZeUJVjBSQhNOcO2wIDAQAB"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_google2daba92534c52915-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "google2daba92534c52915.providentcrm.com"
  records                          = ["google.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_govukpanel-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "govukpanel.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_govuksignup-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "govuksignup.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_govuksurvey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "govuksurvey.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_hallmarq-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hallmarq.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_harvest-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "harvest.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_hevac-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hevac.providentcrm.com"
  records                          = ["www.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_hs1-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hs1._domainkey.providentcrm.com"
  records                          = ["providentcrm-com.hs01a.dkim.hubspotemail.net."]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_hs2-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "hs2._domainkey.providentcrm.com"
  records                          = ["providentcrm-com.hs01b.dkim.hubspotemail.net."]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_iqm-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "iqm.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_jenkins-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "jenkins.providentcrm.com"
  records                          = ["194.125.153.184"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_kb_test-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "kb_test.providentcrm.com"
  records                          = ["dmz5.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_knightfrank-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "knightfrank.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_march-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "march.providentcrm.com"
  records                          = ["272EFD9643"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_marketing-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "marketing.providentcrm.com"
  records                          = ["eu.hostssl.msgapp.com1"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_marketinvoice-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "marketinvoice.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_meath-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "meath.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_meath-portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "meath-portal.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_meath-portal-uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "meath-portal-uat.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_meathvanilla-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "meathvanilla.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_mgmboats-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "mgmboats.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_moorepay-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "moorepay.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_moorepay-uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "moorepay-uat.providentcrm.com"
  records                          = ["TST-ALB-VPC01-49502361.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_msgapp-002E-_domainkey-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "msgapp._domainkey.providentcrm.com"
  records                          = ["k=rsa;p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDasswtodxAxfHPmN5hipc7y77k5sGjdO5Pf/4kUZ2wuBd9gxCIpnsTjKS88eXkCf0LHaRvmYwNgECQslOAqdirJIqtM08Hym609p1IbV1+eEHXWU1VTLmDDBmEKrG9nl1nrchZUGaIXzDzlq8kZL+pkvQoIid/DoFHW3GbpN2XvwIDAQAB;"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_mulveyheating-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "mulveyheating.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_nppu-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "nppu.providentcrm.com"
  records                          = ["digoc1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_ok-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ok.providentcrm.com"
  records                          = ["okt.to"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_onlineplanning-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "onlineplanning.providentcrm.com"
  records                          = ["89.101.248.150"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_onwave-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "onwave.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_opw-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "opw.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_pages-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "pages.providentcrm.com"
  records                          = ["pages.salesfusion.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_pah-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "pah.providentcrm.com"
  records                          = ["ukweb3.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_particular-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "particular.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_prd-lmp-ec201-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "prd-lmp-ec201.providentcrm.com"
  records                          = ["176.34.251.105"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_provident-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "provident.providentcrm.com"
  records                          = ["web7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.com"
  records                          = ["54.155.23.123"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.com"
  records                          = ["10 providentcrm-com.mail.protection.outlook.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.com"
  records                          = ["ns-106.awsdns-13.com.", "ns-1382.awsdns-44.org.", "ns-1668.awsdns-16.co.uk.", "ns-989.awsdns-59.net."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.com"
  records                          = ["ns-1382.awsdns-44.org. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.com"
  records                          = ["\\\"v=spf1 mx a:ebarrier.providentit.com include:_spf.google.com include:amazonses.com include:6638984.spf08.hubspotemail.net include:auth.msgapp.com include:spf.protection.outlook.com ~all", "google-site-verification=MW0W7RUeROyufQdG3uHmrlPSaPT-2H0P8Uu-O075on0", "google-site-verification=yKHwYomUhNC1pc5uSo08vg5RMJHPiMSG-SZ5ew7BGd4"]
  ttl                              = "60"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa10-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa10.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa11-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa11.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa12-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa12.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa6-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa6.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa7-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa7.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa8-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa8.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa81-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa81.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa82-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa82.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_qa9-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "qa9.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_rcsi-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "rcsi.providentcrm.com"
  records                          = ["web1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_rds5-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "rds5.providentcrm.com"
  records                          = ["prd-mys-rds5.cnby34eeobv3.eu-west-1.rds.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_redbox-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "redbox.providentcrm.com"
  records                          = ["www.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_ropwe2eol2otdrl5jvogoean3wbf6ior-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ropwe2eol2otdrl5jvogoean3wbf6ior._domainkey.providentcrm.com"
  records                          = ["ropwe2eol2otdrl5jvogoean3wbf6ior.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox10-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox10.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox11-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox11.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox2-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox2.providentcrm.com"
  records                          = ["dmz7.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox6-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox6.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox7-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox7.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox8-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox8.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sandbox9-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sandbox9.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sbx12-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sbx12.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sbx81-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sbx81.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sbx82-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sbx82.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_scottbader-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "scottbader.providentcrm.com"
  records                          = ["web10.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_scottbader-temp-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "scottbader-temp.providentcrm.com"
  records                          = ["web10.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selectcarleasing-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selectcarleasing.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selectcarleasing-dev-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selectcarleasing-dev.providentcrm.com"
  records                          = ["foxnetworx-howth.duckdns.org"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selectcartest-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selectcartest.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selectcaruat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selectcaruat.providentcrm.com"
  records                          = ["dr5.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selector1-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector1._domainkey.providentcrm.com"
  records                          = ["selector1-providentcrm-com._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_selector2-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector2._domainkey.providentcrm.com"
  records                          = ["selector2-providentcrm-com._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sftp-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sftp.providentcrm.com"
  records                          = ["dmz4.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_shimmersensing-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "shimmersensing.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_shoesforcrews-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "shoesforcrews.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sligoit-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sligoit.providentcrm.com"
  records                          = ["providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_smtpapi-002E-_domainkey-002E-providentcrm-002E-com-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "smtpapi._domainkey.providentcrm.com"
  records                          = ["k=rsa; t=s; p=MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDPtW5iwpXVPiH5FzJ7Nrl8USzuY9zqqzjE0D1r04xDN6qwziDnmgcFNNfMewVKN2D1O+2J9N14hRprzByFwfQW76yojh54Xu3uSbQ3JP0A7k8o8GutRF8zbFUA8n0ZH2y0cIEjMliXY4W4LwPA7m4q0ObmvSjhd63O9d8z1XkUBwIDAQAB"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sslvpn-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sslvpn.providentcrm.com"
  records                          = ["89.101.248.152"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_stobartair-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "stobartair.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_sugar8-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "sugar8.providentcrm.com"
  records                          = ["52.209.90.253"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_swyt-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "swyt.providentcrm.com"
  records                          = ["web6.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_tangotelecom-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "tangotelecom.providentcrm.com"
  records                          = ["PRD-AWS-LB01-1798074464.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_testparticular-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "testparticular.providentcrm.com"
  records                          = ["web1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_tquality-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "tquality.providentcrm.com"
  records                          = ["www.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_trainingcompany-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "trainingcompany.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_trial-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "trial.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_trial_test-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "trial_test.providentcrm.com"
  records                          = ["dmz5.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_trinityresearch-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "trinityresearch.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_tst1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "tst1.providentcrm.com"
  records                          = ["54.220.31.128"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat10-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat10.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat11-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat11.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat12-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat12.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat13-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat13.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat6-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat6.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat7-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat7.providentcrm.com"
  records                          = ["dmz1.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat71-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat71.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat8-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat8.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat81-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat81.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat82-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat82.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_uat9-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "uat9.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_ukweb3-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "ukweb3.providentcrm.com"
  records                          = ["18.133.131.159"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_vbmotgofebjq3dfra4vun4exmh3erj6s-002E-_domainkey-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "vbmotgofebjq3dfra4vun4exmh3erj6s._domainkey.providentcrm.com"
  records                          = ["vbmotgofebjq3dfra4vun4exmh3erj6s.dkim.amazonses.com"]
  ttl                              = "1800"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web1-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web1.providentcrm.com"
  records                          = ["54.228.173.211"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web10-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web10.providentcrm.com"
  records                          = ["52.215.173.144"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web2-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web2.providentcrm.com"
  records                          = ["54.76.132.29"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web3-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web3.providentcrm.com"
  records                          = ["63.35.239.71"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web4-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web4.providentcrm.com"
  records                          = ["54.220.31.128"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web6-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web6.providentcrm.com"
  records                          = ["54.76.132.29"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web7-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web7.providentcrm.com"
  records                          = ["52.49.25.72"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web8-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web8.providentcrm.com"
  records                          = ["52.209.90.253"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_web9-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "web9.providentcrm.com"
  records                          = ["34.241.144.153"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_westlindsey-portal-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "westlindsey-portal.providentcrm.com"
  records                          = ["PRD-ELB-VPC02-71374324.eu-west-1.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_westlindsey-portal-uat-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "westlindsey-portal-uat.providentcrm.com"
  records                          = ["dmz2.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_www-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.providentcrm.com"
  records                          = ["providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_www-legacy-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www-legacy.providentcrm.com"
  records                          = ["3.248.98.62"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_www-old-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www-old.providentcrm.com"
  records                          = ["www.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_www-staging-002E-providentcrm-002E-com-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www-staging.providentcrm.com"
  records                          = ["3.248.98.62"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_www2-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www2.providentcrm.com"
  records                          = ["6638984.group34.sites.hubspot.net"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQ751PH0HNIW2_xenith-002E-providentcrm-002E-com-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "xenith.providentcrm.com"
  records                          = ["PRDUK-ELB-VPC01-1629686208.eu-west-2.elb.amazonaws.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQ751PH0HNIW2_providentcrm-002E-com.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_autodiscover-002E-providentcrm-002E-co-002E-uk-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "autodiscover.providentcrm.co.uk"
  records                          = ["autodiscover.outlook.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk-002E-_A_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.co.uk"
  records                          = ["54.155.23.123"]
  ttl                              = "300"
  type                             = "A"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk-002E-_MX_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.co.uk"
  records                          = ["10 providentcrm-co-uk.mail.protection.outlook.com"]
  ttl                              = "300"
  type                             = "MX"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk-002E-_NS_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.co.uk"
  records                          = ["ns-1410.awsdns-48.org.", "ns-1573.awsdns-04.co.uk.", "ns-675.awsdns-20.net.", "ns-75.awsdns-09.com."]
  ttl                              = "172800"
  type                             = "NS"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk-002E-_SOA_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.co.uk"
  records                          = ["ns-75.awsdns-09.com. awsdns-hostmaster.amazon.com. 1 7200 900 1209600 86400"]
  ttl                              = "900"
  type                             = "SOA"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk-002E-_TXT_" {
  multivalue_answer_routing_policy = "false"
  name                             = "providentcrm.co.uk"
  records                          = ["v=spf1 mx a:ebarrier.providentit.com a:ebarrier1.providentit.com a:mail.marketing.providentit.com include:_spf.google.com include:amazonses.com include:spf.protection.outlook.com ~all"]
  ttl                              = "300"
  type                             = "TXT"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_selector1-002E-_domainkey-002E-providentcrm-002E-co-002E-uk-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector1._domainkey.providentcrm.co.uk"
  records                          = ["selector1-providentcrm-co-uk._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_selector2-002E-_domainkey-002E-providentcrm-002E-co-002E-uk-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "selector2._domainkey.providentcrm.co.uk"
  records                          = ["selector2-providentcrm-co-uk._domainkey.providentcrm0.onmicrosoft.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}

resource "aws_route53_record" "tfer--ZQXLLGH874M07_www-002E-providentcrm-002E-co-002E-uk-002E-_CNAME_" {
  multivalue_answer_routing_policy = "false"
  name                             = "www.providentcrm.co.uk"
  records                          = ["www.providentcrm.com"]
  ttl                              = "300"
  type                             = "CNAME"
  zone_id                          = "${aws_route53_zone.tfer--ZQXLLGH874M07_providentcrm-002E-co-002E-uk.zone_id}"
}
