provider "aws" {
  region = "eu-west-2"
}

variable "ec2name" {
  type = list(string)
  default = ["webserver", "db"]
}

variable "instancedetails" {
  type = map
  default = {
    ami = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
}

/*
  There are NO dependencies, however we are assumuming that we need to first spin up the db server, then the webserver
*/

resource "aws_instance" "webserver" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.ec2name[0]
  }
  depends_on = [ aws_instance.db ]
}

resource "aws_instance" "db" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.ec2name[1]
  }
}