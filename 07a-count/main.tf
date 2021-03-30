provider "aws" {
  region = "eu-west-2"
}

variable "servername" {
  type    = list(string)
  default = ["webserver-1", "webserver-2", "webserver-3"]
}
variable "instancedetails" {
  type = map(any)
  default = {
    ami           = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
}

resource "aws_instance" "db" {
  ami           = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.servername[count.index]
  }
  count = length(var.servername)
}
