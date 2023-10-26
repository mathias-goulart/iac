terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5, < 6"
    }
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

locals {
  # Assuming the provided output is named "user_secrets"
  user_secrets_data = module.iam.user_secrets

  # Prepare the content for each user
  user_content = {
    for user, secrets in local.user_secrets_data :
    user => join("\n", [
      "MFA Key: ${secrets.mfa_key != null ? secrets.mfa_key : "N/A"}",
      "MFA ARN: ${secrets.mfa_arn != null ? secrets.mfa_arn : "N/A"}",
      "User Password: ${secrets.user_password != null ? secrets.user_password : "N/A"}",
      "Access Key ID: ${secrets.access_key != null ? secrets.access_key : "N/A"}",
      "Access Secret Key: ${secrets.access_secret_key != null ? secrets.access_secret_key : "N/A"}"
    ])
  }
}

resource "local_file" "txt_file" {
  for_each = local.user_content

  content  = each.value
  filename = "${path.module}/${each.key}.cred"
}