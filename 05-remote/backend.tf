terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate" // this is where the state file will be located, we are creating a folder called terraform
    bucket = "terraform-abhishek-test-2020" // this is the name of the S3 bucket created manually.
    region = "eu-west-2" // region is required as this may be different from the cloud you are using. probably you are automating AWS and using GCP as remote
    access_key = "ADFASDFASDFASDFADSf" // creds
    secret_key = "kljh234@£4234n234@£$@£Cwsdfs@f£323sd" //creds
  }
}