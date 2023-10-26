locals {
  group_policy = {
    for k, v in var.groups : k => {
      policy_body = v.inline_policy
    } if v.inline_policy != null
  }
  group_policy_attachment = {
    for k, v in var.groups : k => {
      policy_arn = startswith(v.attach_policy, "arn:") ? v.attach_policy : aws_iam_policy.provident_policy[v.attach_policy].arn
    } if v.attach_policy != ""
  }
  user_policy = {
    for k, v in var.users : k => {
      policy_body = v.inline_policy
    } if v.inline_policy != null
  }
  programatic_access_users = {
    for k, v in var.users : k => v if v.programatic_access
  }
  console_access_users = {
    for k, v in var.users : k => v if v.console_access
  }
  mfa_users = {
    for k, v in var.users : k => v if v.enable_mfa
  }
  user_group_membership = {
    for k, v in var.users : k => {
      groups = [for g in v.groups : aws_iam_group.provident_groups[g].name]
    }
  }
  user_secrets = {
    for k, v in var.users : k => {
      mfa_key           = v.enable_mfa ? aws_iam_virtual_mfa_device.provident_user_mfa[k].base_32_string_seed : null
      mfa_arn           = v.enable_mfa ? aws_iam_virtual_mfa_device.provident_user_mfa[k].arn : null
      user_password     = v.console_access ? aws_iam_user_login_profile.provident_user_console[k].encrypted_password : null
      access_key        = v.programatic_access ? aws_iam_access_key.provident_user_key[k].id : null
      access_secret_key = v.programatic_access ? aws_iam_access_key.provident_user_key[k].secret : null
    }
  }
}