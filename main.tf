# Define a single AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0127b2e6f3b9b94d5"
  instance_type = "t2.micro"
  key_name      = "keypair"
  subnet_id     = "subnet-0123456789abcdef"
  tags = {
    Name = "ExampleInstance"
  }
}

# Define a security group to allow inbound SSH traffic
resource "aws_security_group" "ssh" {
  name_prefix = "ssh-"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Associate the security group with the EC2 instance
resource "aws_instance" "example2" {
  security_groups = [aws_security_group.ssh.id]
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "example2-instance"
  }
}
