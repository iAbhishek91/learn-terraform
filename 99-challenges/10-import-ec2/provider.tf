provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "manual" {
  instance_type = "t2.micro"
  ami           = "ami-01c835443b86fe988"
}