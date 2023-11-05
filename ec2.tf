provider "aws" {
  region = "us-east-1"
  access_key = "AKIAYXYC4ZUAXZ75LLTT"
  secret_key = "J36yvg3JQpawz2n2a+71anSwcS0ClOkm46iUJShK"
}



resource "aws_instance" "example" {
  ami           = "ami-05c13eab67c5d8861"  # Replace with the desired AMI ID
  instance_type = "t2.micro"  # Replace with the desired instance type
}

