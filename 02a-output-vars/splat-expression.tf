variable "splat" {
  type = list
  default = ["a", "b", "c"]
}

output "name" {
  value = var.splat[*]
}

// name = tolist([
//    "a",
//    "b",
//    "c",
//])