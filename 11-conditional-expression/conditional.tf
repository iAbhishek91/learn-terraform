provider "aws" {
  region="eu-west-2"
}

resource "aws_instance" "test-ec2" {
  ami = "ami-0661b0fdf04b02637"
  instance_type = "t2.nano"
  tags = {
    "env" = "test"
  }
  count = var.isProd == false ? 1 : 0
}


resource "aws_instance" "prod-ec2" {
  ami = "ami-0661b0fdf04b02637"
  instance_type = "t2.micro"
  tags = {
    "env" = "prod"
  }
  count = var.isProd == true ? 1 : 0
}