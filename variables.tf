# Define input variables for the EC2 instance
variable "ami_id" {
  description = "The ID of the AMI to use for the EC2 instance"
}

variable "instance_type" {
  description = "The type of instance to launch"
}
