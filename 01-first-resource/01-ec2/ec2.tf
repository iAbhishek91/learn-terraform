provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "delete_it" {
  ami = "ami-01c835443b86fe988"
  instance_type = "t2.nano"
}