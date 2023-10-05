data "terraform_remote_state" "alb" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/alb/eu-west-1/terraform.tfstate"
  }
}

data "terraform_remote_state" "sg" {
  backend = "local"

  config = {
    path = "../../../../generated/aws/sg/eu-west-1/terraform.tfstate"
  }
}
