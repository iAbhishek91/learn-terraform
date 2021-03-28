// create a s3 bucket with the same name mentioned below
// create a dynamodb with the same name mentioned below, with primary key named "LockID"
terraform {
  backend "s3" {
    bucket = "remote-backend-with-lock"
    key    = "terraform.tfstate"
    encrypt = true
    region = "eu-west-2"
    dynamodb_table = "tf-state-lock" // this will enable locking for s3
  }
}