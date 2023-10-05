data "terraform_remote_state" "vpc" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/vpc/eu-west-1/terraform.tfstate"
  }
}
