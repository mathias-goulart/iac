# AWS Costs monitors

# PHP Services monitors
resource "datadog_monitor" "monitor_cpu_utilization" {
  for_each           = local.install_datadog_agent_on
  name               = "${each.value.name} CPU Monitor"
  type               = "metric alert"
  message            = "Critical CPU usage for instance ${each.value.name} Notify: ${local.notification_users_str}"
  escalation_message = "Critical CPU usage for instance ${each.value.name} Escalation message. Notify: ${local.notification_users_str}"
  priority           = 1

  query = "avg(last_1h):avg:aws.ec2.cpuutilization{host:${each.value.alias != null ? each.value.alias : each.value.name}} > ${local.datadog_global_config.monitors.critical}"

  monitor_thresholds {
    warning  = local.datadog_global_config.monitors.warning
    critical = local.datadog_global_config.monitors.critical
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Instance"]
}

# Memory utilization
resource "datadog_monitor" "monitor_memory_utilization" {
  for_each           = local.install_datadog_agent_on
  name               = "${each.value.name} MEM Monitor"
  type               = "metric alert"
  message            = "Critical Memory usage for instance ${each.value.name} Notify: ${local.notification_users_str}"
  escalation_message = "Critical Memory usage for instance ${each.value.name} Escalation message. Notify: ${local.notification_users_str}"
  priority           = 1

  query = "avg(last_5m):avg:system.mem.used{host:${lower(each.value.name)}} / avg:system.mem.total{host:${lower(each.value.name)}} * 100 > ${local.datadog_global_config.monitors.critical}"

  monitor_thresholds {
    warning  = local.datadog_global_config.monitors.warning
    critical = local.datadog_global_config.monitors.critical
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Instance"]
}

# Disk monitors

resource "datadog_monitor" "monitor_disks_per_device" {
  for_each           = local.map_monitors_disk_per_server
  name               = "${each.value.server_name} disk ${each.value.path}"
  type               = "metric alert"
  message            = "Partition is getting full on the server ${each.value.server_name} Notify: ${local.notification_users_str}"
  escalation_message = "Partition is getting full on the server ${each.value.server_name} Escalation message. Notify: ${local.notification_users_str}"
  priority           = 1

  query = "avg(last_5m):avg:system.disk.utilized{${each.value.metric}} by {device} > ${local.datadog_global_config.monitors.critical}"

  monitor_thresholds {
    warning  = local.datadog_global_config.monitors.warning
    critical = local.datadog_global_config.monitors.critical
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Instance"]
}