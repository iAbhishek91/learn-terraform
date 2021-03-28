provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "ami_id" {
  most_recent = true
  owners      = ["amazon"]
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

resource "aws_instance" "configured_ec2" {
  ami           = data.aws_ami.ami_id.image_id
  instance_type = "t2.micro"
  key_name      = "abhishek"
  provisioner "remote-exec" {
    // inline allows us to execute a commnad on the ec2 instance
    inline = [
      // download nginx version 1.12, is amazon ami
      "sudo amazon-linux-extras install -y nginx1.12",
      // start and enable nginx
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      // manually generate a key pair befor
      e tf apply
      private_key = file("./abhishek.pem")
      host        = self.public_ip
    }
  }
}

output "ip_address" {
    value = aws_instance.configured_ec2.public_ip
}