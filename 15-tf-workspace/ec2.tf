provider "aws" {
  region = "eu-west-2"
}


// creating the mapping
variable "instance_type" {
  type = map(any)
  default = {
    default = "t2.micro"
    dev     = "t2.nano"
    prod    = "t2.large"
  }

}

resource "aws_instance" "db" {
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_type[terraform.workspace] // lookup(var.instance_type, terraform.workspace, var.instance_type["default"])
  tags = {
    "Name" = "db server"
  }
}


data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}