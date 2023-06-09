# Define a single AWS EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  key_name      = "Vinig1305"
  subnet_id     = "subnet-0f4cdd8193abb2545"
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
  ami           = "ami-02396cdd13e9a1257"
  instance_type = "t2.micro"
  key_name      = "Vinig1305"
  subnet_id     = "subnet-0f4cdd8193abb2545"
  vpc_security_group_ids = ["sg-0130010fc161b5666"]
  tags = {
    Name = "Example2Instance"
  }
}
