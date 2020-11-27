provider "aws" {
  region = "eu-west-2"
}

// importing a module
module "ec2module" {
  source = "./ec2"
  // passing values to module
  instancedetails = {
    name = "webserver"
    ami = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
}


//reading values from module
output "name" {
  value = module.ec2module.webserver_public_ip
}