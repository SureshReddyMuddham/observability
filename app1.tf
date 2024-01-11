provider "aws" {
  region = "us-east-1" # Set your desired region
}

resource "aws_instance" "example" {
  ami           = "ami-0005e0cfe09cc9050" # Specify the AMI ID for your desired image
  instance_type = "t2.micro" # Set your desired instance type

#  key_name = "your-key-pair-name" # Set your key pair name

  # Use the default VPC and subnet
  subnet_id = aws_default_subnet.default.id

  # Use default security group
  vpc_security_group_ids = [aws_default_security_group.default.id]

  tags = {
    Name = "example-instance"
  }
}

resource "aws_default_vpc" "default" {}

resource "aws_default_subnet" "default" {
  availability_zone = "us-east-1a" # Set your desired availability zone
}

resource "aws_default_security_group" "default" {
  vpc_id = aws_default_vpc.default.id
}
