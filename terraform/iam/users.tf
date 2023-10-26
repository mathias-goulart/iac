resource "aws_iam_user_policy" "provident_user_policy" {
  for_each = local.user_policy
  name     = "${title(each.key)}InlinePolicy"
  user     = aws_iam_user.provident_user[each.key].name
  policy   = jsonencode(each.value.policy_body)
}

resource "aws_iam_user" "provident_user" {
  for_each = var.users
  name     = each.key
  path     = each.value.path
  tags = merge(each.value.aditional_tags, {
    fullname = each.value.fullname
    email    = each.value.email
  })
}

resource "aws_iam_access_key" "provident_user_key" {
  for_each = local.programatic_access_users
  user     = aws_iam_user.provident_user[each.key].name
}

resource "aws_iam_user_login_profile" "provident_user_console" {
  for_each = local.console_access_users
  user     = aws_iam_user.provident_user[each.key].name
  # pgp_key                 = "keybase:${each.key}"
  password_length         = each.value.password_length != null ? each.value.password_length : var.default_password_length
  password_reset_required = true
}

resource "aws_iam_virtual_mfa_device" "provident_user_mfa" {
  for_each                = local.mfa_users
  virtual_mfa_device_name = "${lower(each.key)}_mfa_device"
  path                    = each.value.path
}

resource "aws_iam_user_group_membership" "provident_users_groups" {
  for_each = local.user_group_membership
  user     = aws_iam_user.provident_user[each.key].name

  groups = each.value.groups
}