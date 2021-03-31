provider "aws" {
  region = "eu-west-2"
}


resource "aws_iam_user" "name" {
  for_each = toset([ "abhi", "dinesh", "subho"])
  name = each.value
}

// output "names" {
  // NOTE: splat expressions are only for lists only, and hence cant be used with resource creaeted using for_each
  // value = aws_iam_user.name[*].arn // this throws error
// }