variable "keys" {
  type = list
  default = ["orange", "pinapple", "strawberry"]
  description = "keys of the map"
}

variable "values" {
  type = list
  default = ["orange", "yellow", "red"]
  description = "values of the map"
}

locals {
  zipmap = zipmap(var.keys, var.values)
}

output "zipmap" {
  value = {
    direct = zipmap(var.keys, var.values),
    local = local.zipmap["strawberry"]
  }
}

//zipmap = {
//  "direct" = tomap({
//    "orange" = "orange"
//    "pinapple" = "yellow"
//    "strawberry" = "red"
//  })
//  "local" = "red"
//}
