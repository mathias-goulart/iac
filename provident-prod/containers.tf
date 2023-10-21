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