# AWS Costs monitors

# PHP Services monitors
resource "datadog_monitor" "cpu_usage_ec2_instance" {
  for_each           = local.install_datadog_agent_on
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