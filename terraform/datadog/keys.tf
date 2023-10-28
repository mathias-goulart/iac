resource "datadog_api_key" "dd_agent_key" {
  for_each = var.agent_keys
  name     = each.key
}

resource "aws_secretsmanager_secret" "dd_agent_secret" {
  for_each = local.agent_keys_secrets_managed
  name     = each.value.secrets_name
}

resource "aws_secretsmanager_secret_version" "dd_agent_secret_version" {
  for_each      = local.agent_keys_secrets_managed
  secret_id     = aws_secretsmanager_secret.dd_agent_secret[each.key].id
  secret_string = datadog_api_key.dd_agent_key[each.key].key
}