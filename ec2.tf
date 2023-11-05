provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

resource "aws_security_group" "My_Monday_Task" {
  name        = "http-https-ssh-sg"
  description = "Allow HTTP, HTTPS, and SSH traffic"
}

resource "aws_security_group_rule" "http_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow HTTP from anywhere (not recommended for production)
  security_group_id = aws_security_group.My_Monday_Task.id
}

resource "aws_security_group_rule" "https_ingress" {
  type        = "ingress"
  from_port   = 443
  to_port     = 443
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow HTTPS from anywhere (not recommended for production)
  security_group_id = aws_security_group.My_Monday_Task.id
}

resource "aws_security_group_rule" "ssh_ingress" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]  # Allow SSH from anywhere (not recommended for production)
  security_group_id = aws_security_group.My_Monday_Task.id
}

resource "aws_security_group_rule" "all_egress" {
  type        = "egress"
  from_port   = 0
  to_port     = 0
  protocol    = "-1"  # Allow all outbound traffic
  cidr_blocks = ["0.0.0.0/0"]  # Allow all outbound traffic
  security_group_id = aws_security_group.My_Monday_Task.id
}

resource "aws_instance" "example" {
  ami           = "ami-0bb09e28eeb9961b4"  # Replace with the desired AMI ID
  instance_type = "t2.micro"  # Replace with the desired instance type
  security_groups = [aws_security_group.My_Monday_Task.name]
}
