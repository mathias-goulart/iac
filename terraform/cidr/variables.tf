variable "cidr" {
  type        = string
  description = "The base CIDR"
  validation {
    condition     = length(regexall("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$", var.cidr)) > 0
    error_message = "Invalid base CIDR"
  }
}

variable "in_range" {
  type        = list(string)
  description = "The IP or Range (CIDR) notation to be tested"
  validation {
    condition     = alltrue([for cidr in var.in_range : length(regexall("^([0-9]{1,3}\\.){3}[0-9]{1,3}(\\/([0-9]|[1-2][0-9]|3[0-2]))?$", cidr)) > 0])
    error_message = "Invalid address CIDR"
  }
}