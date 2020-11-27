provider "aws" {
  region = "eu-west-2"
}

variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enable" {
  default = true
}

# useful when we need to use firewall rules which are generally not one
variable "mylist" {
  type = list(string)
  default = ["terraform", "val2", "val3"]
}

variable "mymap" {
  type = map
  default = {
    key1 = "value1"
    env = "development"
  }
}

variable "inputname" {
  type = string
  description = "Please input the name of the vpc"
}

variable "mytuple" {
  type = tuple([string, number, string])
  default = ["a", 0, "b"]
}

variable "myobject" {
  type = object({
    name = string
    port = list(number)
  })
  default = {
    name = "Abhishek"
    port = [22, 80, 443]
  }
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