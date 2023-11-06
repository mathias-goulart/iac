module "containers" {
  source = "../terraform/containers"

  providers = {
    aws = aws.ireland
  }

  repos = {
    datadog_agent = {
      scan_on_push = true
    }
  }
  replication = {
    all = {
      destination = ["eu-west-2"]
    }
  }
}

moved {
  from = module.iam
  to   = module.ecr_users
}

module "ecr_users" {
  source = "../terraform/iam"

  providers = {
    aws = aws.ireland
  }

  users = {
    ddagent_test = {
      programatic_access = true
      groups             = ["datadog"]
    }
  }

  groups = {
    datadog = {
      attach_policy = "datadog_agent_policy"
    }
  }

  roles = {}

  policies = {
    datadog_agent_policy = {
      name        = "DatadogAgentPolicy"
      description = "Policy for Datadog Agent group. Allowed to download images"
      policy_body = jsonencode({
        Version = "2012-10-17",
        Statement = [
          {
            Effect = "Allow",
            Action = [
              "ecr:GetDownloadUrlForLayer",
              "ecr:BatchGetImage",
              "ecr:BatchCheckLayerAvailability",
              "ecr:PutImage",
              "ecr:InitiateLayerUpload",
              "ecr:UploadLayerPart",
              "ecr:CompleteLayerUpload"
            ],
            Resource = "arn:aws:ecr:region:account-id:repository/datadog_agent"
          }
        ]
      })
    }
  }
}