resource "aws_lb" "main_alb" {
  name               = "${lower(var.customer_name)}-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.public_alb_sg.id]
  subnets            = [for k, v in local.public_sub_names : aws_subnet.public_subnets[k].id]

  enable_deletion_protection = false

  tags = {
    Environment = "Test"
    Terraform   = "True"
  }
}

resource "aws_lb_target_group" "datadog_instances_tg" {
  name        = "${lower(var.customer_name)}-dev-tg"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.main_vpc.id
  target_type = "instance"

  health_check {
    enabled  = true
    interval = 20
    matcher  = "200,299"
    path     = "/"
    port     = "traffic-port"
  }
}

resource "aws_lb_listener" "main_alb_lst_port_80" {
  load_balancer_arn = aws_lb.main_alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.datadog_instances_tg.arn
  }
}

resource "aws_lb_target_group_attachment" "datadog_instances_attchment" {
  for_each         = local.private_sub_names
  target_group_arn = aws_lb_target_group.datadog_instances_tg.arn
  target_id        = aws_instance.datadog_instances[each.key].id
  port             = 80
}