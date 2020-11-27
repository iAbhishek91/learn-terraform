provider "aws" {
  region = "eu-west-2"
}

// number of server are given input from variable files
variable "number_of_server" {
  type = number
}
variable "server_names" {
  type = list(string)
}


resource "aws_instance" "db" {
  ami = "ami-08b993f76f42c3e2f"
  instance_type = "t2.micro"
  tags = {
    "Name" = var.server_names[count.index]
  }
  count = var.number_of_server
}
