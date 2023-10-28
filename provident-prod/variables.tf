variable "datadog_api_key" {
  type        = string
  sensitive   = true
  description = "The Datadog API Key"
}

variable "datadog_app_key" {
  type        = string
  sensitive   = true
  description = "The Datadog APP Key"
}
