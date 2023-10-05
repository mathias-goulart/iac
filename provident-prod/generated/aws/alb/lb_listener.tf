resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-32d6ae7f9270ec0f" {
  default_action {
    order = "1"

    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }

    type = "redirect"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--PRD-AWS-LB01_id}"
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-AWS-LB01-002F-db67f07a16d5b603-002F-3ab4ff6758dfc802" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/6ab3cd23-125c-476f-bc06-652cc056d894"

  default_action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/Provident-ElasticLB-Cluster/51e4d92cf6ade766"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--PRD-AWS-LB01_id}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-84aee5cf8b55adea" {
  default_action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02/b07e209cf3169296"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--PRD-ELB-VPC02_id}"
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-PRD-ELB-VPC02-002F-d2a093722e39d027-002F-bc3eaed157dd2e79" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/6ab3cd23-125c-476f-bc06-652cc056d894"

  default_action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/PRD-APX-VPC01-02-https/26d15933037126ae"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--PRD-ELB-VPC02_id}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-2-Ext-2018-06"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-TST-ALB-VPC01-002F-6896e7fa79816414-002F-002db5a7f2028a3d" {
  default_action {
    order = "1"

    redirect {
      host        = "#{host}"
      path        = "/#{path}"
      port        = "443"
      protocol    = "HTTPS"
      query       = "#{query}"
      status_code = "HTTP_301"
    }

    type = "redirect"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--TST-ALB-VPC01_id}"
  port              = "80"
  protocol          = "HTTP"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-TST-ALB-VPC01-002F-6896e7fa79816414-002F-3be40b84efb73d70" {
  certificate_arn = "arn:aws:acm:eu-west-1:246118185699:certificate/6ab3cd23-125c-476f-bc06-652cc056d894"

  default_action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/JustTST01/629792ba6bcc1bbd"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--TST-ALB-VPC01_id}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
}

resource "aws_lb_listener" "tfer--arn-003A-aws-003A-elasticloadbalancing-003A-eu-west-1-003A-246118185699-003A-listener-002F-app-002F-datadogmgtest-lb-tf-002F-ad0c3c2cd962a6fd-002F-7a8b98100bb6e457" {
  default_action {
    order            = "1"
    target_group_arn = "arn:aws:elasticloadbalancing:eu-west-1:246118185699:targetgroup/datadogmgtest-dev-tg/dfc1f3bbbf0f3e80"
    type             = "forward"
  }

  load_balancer_arn = "${data.terraform_remote_state.alb.outputs.aws_lb_tfer--datadogmgtest-lb-tf_id}"
  port              = "80"
  protocol          = "HTTP"
}
