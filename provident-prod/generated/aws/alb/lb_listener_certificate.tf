resource "aws_lb_listener_certificate" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/80191ef6-b88d-4d25-ab34-05622cf7c27a"
  listener_arn    = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_id}"
}

resource "aws_lb_listener_certificate" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-af61c5c4-4d50-449b-ba29-1de24943e434" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/af61c5c4-4d50-449b-ba29-1de24943e434"
  listener_arn    = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_id}"
}

resource "aws_lb_listener_certificate" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-f475c198-5dab-4f37-8f25-9dcc1ecdaf8e" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/f475c198-5dab-4f37-8f25-9dcc1ecdaf8e"
  listener_arn    = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_id}"
}

resource "aws_lb_listener_certificate" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-f827d12b-6b32-4289-bf42-39fb2b8971cc" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/f827d12b-6b32-4289-bf42-39fb2b8971cc"
  listener_arn    = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802_id}"
}

resource "aws_lb_listener_certificate" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_arn-003A-aws-003A-acm-003A-eu-west-1-003A-246118185699-003A-certificate-002F-80191ef6-b88d-4d25-ab34-05622cf7c27a" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/80191ef6-b88d-4d25-ab34-05622cf7c27a"
  listener_arn    = "${data.terraform_remote_state.alb.outputs.aws_lb_listener_tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79_id}"
}
