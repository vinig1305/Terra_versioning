Terra_versioning
# Define a single AWS EC2 instance
resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name = "example-instance"
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
resource "aws_instance" "example" {
  security_groups = [aws_security_group.ssh.id]
}
