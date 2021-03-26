provider "aws" {
  region = "eu-west-2"
}

locals {
  common_tags = {
      owner = "DevOps Team",
      service = "backend"
  }
  time = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
}

resource "aws_instance" "ec2" {
  instance_type = "t2.micro"
  ami = "ami-0661b0fdf04b02637"
  tags = local.common_tags
}

output "time" {
  value = local.time
}