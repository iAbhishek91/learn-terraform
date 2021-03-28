terraform {
  backend "s3" {
    bucket = "weebuy-remote-terraform-state"
    key    = "terraform.tfstate"
    encrypt = true
    region = "ap-south-1"
  }
}