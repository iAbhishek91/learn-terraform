# Variables

## Syntax

```tf
variable "vpcname" {
  type = string
  default = "myvpc"
}

variable "sshport" {
  type = number
  default = 22
}

variable "enabled" {
  default = true
}
```

> REFER: Example scenarios

## Input variables

input variables are declared in the same way as normal variables only that it do not have a default value.

```tf
variable "anyName" {
  type = string
  description = "Please enter a value for anyName"
}
```

## List | Map | Tuple | Object

**List** array of specific type | *type = list(string)*
**Map** key-value pair          | *type = map*
**Tuple** array of mixed type   | *type = tuple([string, number, string])*
**Object** named key value pair | *type = object({ name = string, port = list(number) })*
