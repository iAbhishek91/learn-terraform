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

## Arguments

- **default**: this makes the variable optional, and default value will be used.
- **type**: to mention the data type *type is a kind of validation, if not mentioned anything is accepted*
  - basic types: string, number, bool
  - complex type: list, tuple, set, map, object
- **validation**: introduced in version 0.13
- **description**: this is used for input variable documentation
- **sensitive**: boolean value, if it is true, the the value of the variable will not be displayed in plan or apply, however it will be displayed in case of error or logs from providers. *it's similar to password field*.

## Type Conversion

There is no explicit type conversion, but whenever terraform wants it does it automatically

- bool to string: true to "true"
- string to bool: "false" to false
- number to string: 10 to "10"

## Value assignment to variable

There are multiple way we can assign value to variable

- **default (common)**: if default is not mentioned then the variable should come explicitly.
- **environment variable** *this is not much as you can understand*: setx|export TF_VAR_variable_name="value"
- **from a file** tf plan --var-file=xyz.tfvars (default is terraform.tfvars, no need to mention the variable file name explicitly)
- **command line flag** *this is not much used though as too much typing is required*: tf plan -var="instancetype=t2.nano" # this will override default values

## List | Map | Tuple | Object

**List** array of specific type | *type = list(string)*                                   | var.list_type[0]
**Tuple** array of mixed type   | *type = tuple([string, number, string])*                | var.tuple_type[0]
**Set** array of mixed type     | *type = set(string)*                                    | var.set_type[0]
**Map** key-value pair          | *type = map() | map*                                    | var.map_type["key-1"]
**Object** named key value pair | *type = object({ name = string, port = list(number) })* | var.object_type["name"]
