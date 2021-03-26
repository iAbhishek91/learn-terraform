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
  security_groups = [ aws_security_group.webtraffic.name ]
}

# security groups are like firewall rules in GCP
resource "aws_security_group" "webtraffic" {
  name = "allow HTTPS"

  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 443
    protocol = "TCP"
    to_port = 443
  }
}

/*
If we want to whitelist something dynamically, reference it via public ip, below:
cidr_blocks = [ "${aws_eip.lb.public_ip}/32"] // note "/32" is just a concatenation
*/