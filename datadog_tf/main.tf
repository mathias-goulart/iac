terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "> 5, < 6"
    }
    datadog = {
      source = "DataDog/datadog"
    }
    ansible = {
      version = "~> 1.1.0"
      source  = "ansible/ansible"
    }
  }
}