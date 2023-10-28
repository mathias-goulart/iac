provider "aws" {
  shared_credentials_files = ["$HOME/.aws/credentials"]
  region                   = "eu-west-1"
  alias                    = "ireland"
}

provider "aws" {
  shared_credentials_files = ["$HOME/.aws/credentials"]
  region                   = "eu-west-2"
  alias                    = "london"
}

provider "datadog" {
  api_key  = var.datadog_api_key
  app_key  = var.datadog_app_key
  api_url  = "https://app.datadoghq.eu"
  validate = false
}