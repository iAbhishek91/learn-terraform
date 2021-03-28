resource "aws_iam_user" "tf_user" {
  name = "terrafrom"
  path = "/system/"
}