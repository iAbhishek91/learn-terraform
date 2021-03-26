// can be kept in same or different file, it do not really matter
// as terraform will process all the .tf files.
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
