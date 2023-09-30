resource "aws_flow_log" "vpc_log_flow" {
  iam_role_arn    = aws_iam_role.vpc_log_flow_role.arn
  log_destination = aws_cloudwatch_log_group.vpc_log_flow_group.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.main_vpc.id
}

resource "aws_cloudwatch_log_group" "vpc_log_flow_group" {
  name              = "/${var.customer_name}/vpc/log/flow"
  retention_in_days = 1
}

data "aws_iam_policy_document" "vpc_log_flow_role_doc" {
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
  name               = "${title(var.customer_name)}LogFlowRole"
  assume_role_policy = data.aws_iam_policy_document.vpc_log_flow_role_doc.json
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
  name   = "${title(var.customer_name)}LogFlowPolicy"
  role   = aws_iam_role.vpc_log_flow_role.id
  policy = data.aws_iam_policy_document.vpc_log_flow_policy_doc.json
}