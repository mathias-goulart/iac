data "terraform_remote_state" "route_table" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/route_table/eu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/vpc/eu-west-1/terraform.tfstate"
  }
}
