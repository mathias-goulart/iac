data "terraform_remote_state" "ebs" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/ebs/eu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/sg/eu-west-1/terraform.tfstate"
  }
}
