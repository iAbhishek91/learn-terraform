provider "aws" {
  region = "eu-west-2"
}

variable "vpcdetails" {
  type = map
  default = {
    name = "TerraformVPC"
    cidr = "192.168.0.0/24"
  }
}

resource "aws_vpc" "myvpc" {
  cidr_block = var.vpcdetails["cidr"]
  tags = {
    Name = var.vpcdetails["name"]
  }
}