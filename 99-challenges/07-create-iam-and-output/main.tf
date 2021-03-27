provider "aws" {
  region = "eu-west-2"
}


resource "aws_iam_user" "name" {
  name = "iam-user.${count.index}"
  count = 3
  path = "/system/"
}

// splat expression and zipmap is used
// this can used
output "name" {
  value = {
      name = aws_iam_user.name[*].name,
      arn = aws_iam_user.name[*].arn,
      // combined will much more easy to read in case you have many iam roles
      combined = zipmap(aws_iam_user.name[*].name, aws_iam_user.name[*].arn)
  }
}