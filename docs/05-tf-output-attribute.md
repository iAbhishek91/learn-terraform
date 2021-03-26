# Output And Attributes

## Output

One major use case of apart from printing the output is that, output value also act as a input to other resources being created via terraform.

### Syntax

```js
output "myOutput" {
  value = aws_vpc.myvpc.id
}

// if attribute is not provided then every attribute will be printed
// value = aws_vpc.myvpc
```

## Attribute

Terraform have pre-defined **list of attributes for each resource per provider**.

Also note that attributes values are sometime computed when applied, *hence to see the value of the attribute we need to apply, may not work at plan.*

**syntax**: "resource_type.name.attribute"

**example**: "aws_vpc.myvpc.id"

For example: list of all the attributes for AWS VPC check the below link.

https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/vpc
