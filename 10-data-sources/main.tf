provider "aws" {
  region = "eu-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-08b993f76f42c3e2f"
  instance_type = "t2.micro"
  tags = {
    "Name" = "db server"
  }
}


data "aws_instance" "dbsearch" {
  filter {
    name = "tag:Name"
    values = [ "db server" ]
  }
}

output "dbserver" {
  value = data.aws_instance.dbsearch.availability_zone
}