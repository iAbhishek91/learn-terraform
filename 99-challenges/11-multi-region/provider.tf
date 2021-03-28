terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  alias = "London"
  region = "eu-west-2"
}

provider "aws" {
  // alias helps us to provide multiple configuration for same providers
  alias = "Mumbai"
  region = "ap-south-1"
}