variable "sanbox" {
  type        = bool
  default     = false
  description = "Determines if this script should run in sanbox mode"
}

variable "pref_region" {
  type        = string
  default     = "eu-west-1"
  description = "Set the preferable region for the script"
}

variable "default_tags" {
  type = map(string)
  default = {
    "author"     = "Terraform"
    "created_by" = "Terraform"
    "credit_tag" = ""
  }
  description = "Set default tags"
}