resource "datadog_monitor" "system_load_per_az" {
  for_each           = local.availability_zones
  name               = "Service Load AZ ${each.key}"
  type               = "metric alert"
  message            = "Critical Service Load in ${each.value.region_name} AZ ${each.value.az_name}. Notify: ${local.notification_users_str}"
  escalation_message = "Critical Service Load in ${each.value.region_name} AZ ${each.value.az_name}. Escalation message. Notify: ${local.notification_users_str}"
  priority           = 3

  query = "avg(last_5m):avg:system.load.1{availability-zone:${each.value.az_name}} by {availability-zone} > 90"

  monitor_thresholds {
    warning  = 70
    critical = 90
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Zone"]
}

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

resource "datadog_monitor" "cpu_usage_ec2_instance" {
  for_each           = local.datadog_instances_details
  name               = "CPU Usage for ${each.value.name}"
  type               = "metric alert"
  message            = "Critical CPU usage for instance ${each.value.private_ip} Notify: ${local.notification_users_str}"
  escalation_message = "Critical CPU usage for instance ${each.value.private_ip} Escalation message. Notify: ${local.notification_users_str}"
  priority           = 1

  query = "avg(last_5m):avg:aws.ec2.cpuutilization{host:${each.key}} by {instance_id} > 85"

  monitor_thresholds {
    warning  = 75
    critical = 85
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Instance"]
}