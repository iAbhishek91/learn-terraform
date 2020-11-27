provider "aws" {
  region = "eu-west-2"
}


module "db" {
  source = "./db"
  instancedetails = {
    name = "webserver"
    ami = "ami-08b993f76f42c3e2f"
    instance_type = "t2.micro"
  }
  names = ["webserver-1", "webserver-2", "webserver-3"]
}

output "privateIP" {
  value = module.db.publicIP
}