provider "aws" {
  region = "eu-west-2"
}


## to see the values use tf plan (no need to apply the resource)
resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    DynamicName = var.inputname
    Name = var.vpcname
    Use = var.mylist[0]
    Env = var.mymap["env"]
  }
}

# output when we are applying the ferraform
output "vpcid" {
  value = aws_vpc.myvpc.id
}