# Splat expression

Splat expression allows us to get a list of all the attributes.

Is kind of regular expression in a different syntax.

Suppose you have 10 ec2 instance all have a name of ec2-*, and you wish to know the arn of them

then use the below

```hcl
resource "aws_iam_user" "lb" {
    name = "iamuser.${count.index}
    count = 3
    path = "/system/"
}

output "arns" {
    value = aws_iam_user.lb[*].arn // if we give aws_iam_user.lb[0].arn only first arn will be written
}
```
