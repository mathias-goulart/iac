# ------------------------------------------------------
# DATABASES MONITORING
# ------------------------------------------------------

resource "datadog_monitor" "database_replication_monitors" {
  for_each           = local.monitored_dabases
  name               = "${upper(each.value.name)} Replication"
  type               = "metric alert"
  message            = "Cluster replication seems to be failing ${upper(each.value.name)} Notify: ${local.notification_users_str}"
  escalation_message = "Cluster replication seems to be failing ${upper(each.value.name)} Escalation message. Notify: ${local.notification_users_str}"
  priority           = 1

  query = "avg(last_1h):anomalies(aws.rds.aurora_replica_lag{dbclusteridentifier:${each.value.name}}, 'basic', 2, direction='both', interval=60, alert_window='last_15m', count_default_zero='true', seasonality='daily') >= ${local.datadog_global_config.monitors.critical / 100}"

  monitor_thresholds {
    warning  = local.datadog_global_config.monitors.warning / 100
    critical = local.datadog_global_config.monitors.critical / 100
  }

  include_tags = true

  tags = ["created_by:Terraform", "provident_type:Database"]
}