// the value of this variable is passed from the modules
// best part is we need to change this file again, as eerything is parameterised.
variable "instancedetails" {
  type = map
}


resource "aws_instance" "webserver" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.instancedetails["name"]
  }
}

// this is kind of export, which can be consumed by modules.
output "webserver_public_ip" {
  value = aws_instance.webserver.public_ip
}