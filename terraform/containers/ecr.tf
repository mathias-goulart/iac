resource "aws_ecr_repository" "provident_private_registry" {
  for_each             = var.repos
  name                 = each.key
  image_tag_mutability = each.value.tag_immutability ? "IMMUTABLE" : "MUTABLE"

  image_scanning_configuration {
    scan_on_push = each.value.scan_on_push
  }
}

resource "aws_ecr_replication_configuration" "replication_rules" {
  replication_configuration {
    dynamic "rule" {
      for_each = local.replication_rules
      content {

        dynamic "destination" {
          for_each = rule.value.destination
          content {
            region      = destination.value
            registry_id = rule.value.registry_id
          }
        }

        dynamic "repository_filter" {
          for_each = rule.value.filters
          content {
            filter      = repository_filter.value
            filter_type = "PREFIX_MATCH"
          }
        }

      }
    }
  }
}