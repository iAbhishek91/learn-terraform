provider "aws" {
  region = "eu-west-2"
}

resource "aws_vpc" "name" {
  cidr_block = "10.0.0.0/0"
}