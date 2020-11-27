// here we are trying to set multiple security-group rules with multiple ports.
// As you might understand that this is tedious using the ingress and egress block (refer xx-challenges/xx-create-ec2-with-sg)
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


variable "ingresrules" {
  type = list(number)
  default = [443, 80]
}

variable "egressrules" {
  type = list(number)
  default = [443, 80, 8080, 3306, 25, 53]
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
  name = "allow http, https, dns etc"

  dynamic "ingress" {
    iterator = port
    for_each = var.ingresrules
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      protocol = "TCP"
      to_port = port.value
    }
  }

  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      cidr_blocks = [ "0.0.0.0/0" ]
      from_port = port.value
      protocol = "TCP"
      to_port = port.value
    }
  }
}