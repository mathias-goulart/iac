resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802-002F-b14334ced6525dd6" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/Provident-ElasticLB-Cluster/51e4d92cf6ade766"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["drhe.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_id}"
  priority     = "1"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-1a6e9a09777256b8" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["opw.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "3"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-290a53b92d42e148" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["meath.providentcrm.com", "meathvanilla.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "2"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-3a7bc77e8524195b" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["copperfasten.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "6"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-7181d929d855a127" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["colt.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "4"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-a2e413468e29ca29" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["meath-portal.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "1"
}

resource "aws_lb_listener_rule" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-rule-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79-002F-b43fbe3d2ce21ce0" {
  action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/JustWEB04/07da8c233eebd866"
    type             = "forward"
  }

  certificate_arn = "${aws_lb_listener_certificate.tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a.arn}"

  condition {
    host_header {
      values = ["moorepay.providentcrm.com"]
    }
  }

  listener_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
  priority     = "5"
}
