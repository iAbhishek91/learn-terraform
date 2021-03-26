provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami = data.aws_ami.ami_id.id
  instance_type = "t2.micro"
  tags = {
    "Name" = "db server"
  }
}


data "aws_ami" "ami_id" {
  most_recent = true
  owners = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}
