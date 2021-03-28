resource "aws_eip" "london-eip" {
  vpc = "true"
  provider = aws.London // note they dont need quotes as they are not string
}

resource "aws_eip" "mumbai-eip" {
  vpc = "true"
  provider = aws.Mumbai // note they dont need quotes as they are not string
}