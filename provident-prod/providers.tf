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