locals {
  replication_rules = {
    for k, v in var.replication : k => merge(v, {
      registry_id = "${data.aws_caller_identity.current.account_id}"
      filters     = toset(v.filter_by_key ? [k == "all" ? "*" : k] : [])
    }) if v.enabled
  }
}