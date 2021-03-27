provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "configured_ec2" {
  ami           = data.aws_ami.ami_id.image_id
  instance_type = "t2.micro"

  provisioner "local-exec" {
    command = "echo ${aws_instance.configured_ec2.public_ip} > public_ip.txt"
  }
}

output "ip_address" {
    value = aws_instance.configured_ec2.public_ip
}