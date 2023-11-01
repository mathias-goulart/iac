data "aws_caller_identity" "current" {}

data "aws_instances" "terraform_instances" {
  instance_tags = {
    Created_By = "Terraform"
  }

  instance_state_names = ["running"]
}

data "aws_instance" "ec2_instances_details" {
  count       = length(data.aws_instances.terraform_instances.ids)
  instance_id = data.aws_instances.terraform_instances.ids[count.index]
}

locals {
  datadog_instances_details = {
    for ec2 in data.aws_instance.ec2_instances_details : ec2.id => {
      private_ip = ec2.private_ip
      name       = ec2.tags.Name
    }
  }
}

module "datadog" {
  source = "../terraform/datadog"

  providers = {
    aws     = aws.ireland # Datadog services are global, so it doesn't matter the region
    datadog = datadog
  }

  datadog_config = {
    api_site = "datadoghq.eu"
    agent_configuration = {
      destination = "/etc/datadog-agent/"
      source      = "<ROOT_MODULE_PATH>/dd_agent/"
      version     = "7.0.4"
    }
  }

  aws_integration = {
    enabled    = true
    account_id = data.aws_caller_identity.current.account_id
  }

  server_list = var.server_list

  agent_keys = {
    aws_agent = {
      store_in_secrets = true
      secrets_name     = "/provident/datadog/aws_agent"
    }
  }
}