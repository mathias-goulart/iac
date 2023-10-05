resource "datadog_api_key" "dd_agent_key" {
  name = "aws_agent"
}

moved {
  from = datadog_api_key.dd_aws_agent_key
  to   = datadog_api_key.dd_agent_key
}

resource "aws_secretsmanager_secret" "dd_agent_secret" {
  name = "/${lower(var.customer_name)}/dd/agent"
}

resource "aws_secretsmanager_secret_version" "dd_agent_secret_version" {
  secret_id     = aws_secretsmanager_secret.dd_agent_secret.id
  secret_string = datadog_api_key.dd_agent_key.key
}