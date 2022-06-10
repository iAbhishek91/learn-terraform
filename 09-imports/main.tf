# choosing aws provider
provider "aws" {
  region = "eu-west-2"
}

# apply this first. so that the state file is created
resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"
}

# add this later; after adding the same resource from cloud console.
# the scenario is that the resource is first created from console and not from Terraform
# the we import the resource using the command "tf import aws_vpc.myvpc2 vpc-05372a0768b93f530" take the id from the cloud console.
# for s3 bucket import "tf import module.ca.aws_s3.s3_bucket name-of-the-bucket"
resource "aws_vpc" "myvpc2" {
  cidr_block = "192.168.0.0/24"
}
