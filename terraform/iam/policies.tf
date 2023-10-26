resource "aws_iam_policy" "provident_policy" {
  for_each    = var.policies
  name        = each.value.name
  description = each.value.description
  policy      = each.value.policy_body
}