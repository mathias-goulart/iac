resource "aws_vpc" "main_vpc" {
  cidr_block           = var.vpc.main_cidr
  enable_dns_support   = var.vpc.enable_dns_support
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
  tags = {
    Name = var.vpc.name
  }
}

resource "aws_vpc_ipv4_cidr_block_association" "vpc_secondary_cidr" {
  for_each   = { for cidr in var.vpc.secondary_blocks : cidr => cidr }
  vpc_id     = aws_vpc.main_vpc.id
  cidr_block = each.value
}

resource "aws_flow_log" "vpc_log_flow" {
  count           = var.vpc.enable_vpc_flow_logs ? 1 : 0
  vpc_id          = aws_vpc.main_vpc.id
  traffic_type    = "ALL"
  iam_role_arn    = aws_iam_role.vpc_log_flow_role[0].arn
  log_destination = aws_cloudwatch_log_group.vpc_log_flow_group[0].arn
}

resource "aws_cloudwatch_log_group" "vpc_log_flow_group" {
  count = var.vpc.enable_vpc_flow_logs ? 1 : 0
  name  = "/${lower(var.vpc.name)}/vpc/logs"
}

data "aws_iam_policy_document" "vpc_log_flow_assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["vpc-flow-logs.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "vpc_log_flow_role" {
  count              = var.vpc.enable_vpc_flow_logs ? 1 : 0
  name               = "${var.vpc.name}_vpc_log_role"
  assume_role_policy = data.aws_iam_policy_document.vpc_log_flow_assume_role.json
}

data "aws_iam_policy_document" "vpc_log_flow_policy_doc" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogGroups",
      "logs:DescribeLogStreams",
    ]

    resources = ["*"]
  }
}

resource "aws_iam_role_policy" "vpc_log_flow_policy" {
  count  = var.vpc.enable_vpc_flow_logs ? 1 : 0
  name   = "${var.vpc.name}_vpc_log_policy"
  role   = aws_iam_role.vpc_log_flow_role[0].id
  policy = data.aws_iam_policy_document.vpc_log_flow_policy_doc.json
}
