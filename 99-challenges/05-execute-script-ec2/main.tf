provider "aws" {
  region = "eu-west-2"
}


variable "instancedetails" {
  type = map
  default = {
    name = "webserver"
    ami = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
}

variable "ingressports" {
  type = list(number)
  default = [80, 443]
}

variable "egressports" {
  type = list(number)
  default = [80, 443]
}


resource "aws_instance" "myec2" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.instancedetails["name"]
  }
  security_groups = [ aws_security_group.webtraffic.name ]
  // file function read the content of the script
  user_data = file("script.sh")
}

# security groups are like firewall rules in GCP
resource "aws_security_group" "webtraffic" {
  name = "allow HTTPS"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingressports
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      protocol = "TCP"
      to_port = port.value
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressports
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      protocol = "TCP"
      to_port = port.value
    }
  }
}

output "PublicIP" {
  value = aws_instance.myec2.public_ip
}