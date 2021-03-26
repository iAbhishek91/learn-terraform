provider "aws" {
  region = "eu-west-2"
}

locals {
  common_tags = {
      owner = "DevOps Team",
      service = "backend"
  }
}

resource "aws_instance" "ec2" {
  instance_type = "t2.micro"
  ami = "ami-0661b0fdf04b02637"
  tags = local.common_tags
}