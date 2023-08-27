terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region                   = "eu-north-1"
  shared_credentials_files = ["C:/Users/mahmo/.aws/credentials"]

}

resource "aws_instance" "tf_webserver" {
  ami           = "ami-0b4ab8a966e0c2b21"

  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-0abca934678d703e5" ]
  user_data = <<EOF
    #!/bin/bash 
    sudo amazon-linux-extras install nginx1 -y
    sudo fuser -k 80/tcp
    sudo fuser -k 443/tcp
    sudo systemctl start nginx
  EOF

  tags = {
    Name = "tf_webserver"
  }

 }
