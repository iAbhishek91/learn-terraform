provider "aws" {
  region = "eu-west-2"
}

locals {
  a = "I'm a"
  // the below is NOT allowed
  // this is called self-referencing
  // b = local.b + local.a
  // this is cycles
  // b = local.c
  // c = local.b
  b = local.a

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
  value = {
    time = local.time
    b = local.b
  }
}