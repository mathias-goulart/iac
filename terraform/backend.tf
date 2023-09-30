terraform {
  backend "s3" {
    bucket = "providentcrm-iac"
    key    = "terraform"
    region = "eu-west-1"
  }
}