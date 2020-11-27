variable "names" {
  type = list(string)
}
variable "instancedetails" {
  type = map
}


resource "aws_instance" "db" {
  ami = var.instancedetails["ami"]
  instance_type = var.instancedetails["instance_type"]
  tags = {
    "Name" = var.names[count.index]
  }
  count = length(var.names)
}


output "publicIP" {
  // wrapping in square bracket is optional
  value = [aws_instance.db.*.public_ip]
}
