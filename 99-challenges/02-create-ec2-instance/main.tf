provider "aws" {
  region = "eu-west-2"
}


variable "instancedetails" {
  type = map
  default = {
    name = "terraform"
    ami = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
}


resource "aws_instance" "myec2" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.instancedetails["name"]
  }
}