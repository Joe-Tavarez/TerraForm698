provider "aws" {
  region = "us-east-1"
}


variable "instances" {
  type = map
  default = {
    "web1" = "t3.micro"
    "web2" = "t3.micro"
    "web3" = "t3.small"
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = "ami-0157af9aea2eef346"
  instance_type = each.value

  tags = {
    Name = "${each.key}"
  }
}
