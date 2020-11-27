# choosing aws provider
provider "aws" {
  region = "eu-west-2"
}

# myvpc is the the name kept internal to terraform
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
}