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

variable "server_list" {
  type        = list(any)
  description = "This doesn't need to be here. Only added because I'm using a public repo"
}

variable "cluster_list" {
  type        = list(any)
  description = "This doesn't need to be here. Only added because I'm using a public repo"
}