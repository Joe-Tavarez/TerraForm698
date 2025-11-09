terraform {
  backend "s3" {
    bucket         = "terraform-state-jtavarez"
    key            = "terraform/state.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-0157af9aea2eef346" # Amazon Linux 2 AMI
  instance_type = "t3.small"
  tags = {
    Name = "Terraform-Test-Instance"
  }
}
 
output "instance_id" {
  value = aws_instance.example.id
}