terraform {
  backend "s3" {
    bucket = "providentcrm-iac"
    key    = "datadog_tf"
    region = "eu-west-1"
  }
}