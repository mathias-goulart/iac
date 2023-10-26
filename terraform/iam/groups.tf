resource "aws_iam_group" "provident_groups" {
  for_each = var.groups
  name     = each.key
  path     = each.value.path
}

resource "aws_iam_group_policy" "provident_group_inline_pol" {
  for_each = local.group_policy
  name     = "${title(each.key)}InlinePolicy"
  group    = aws_iam_group.provident_groups[each.key].name
  policy   = jsonencode(each.value.policy_body)
}

resource "aws_iam_group_policy_attachment" "provident_group_policy_attach" {
  for_each   = local.group_policy_attachment
  group      = aws_iam_group.provident_groups[each.key].name
  policy_arn = each.value.policy_arn
}