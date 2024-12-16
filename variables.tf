variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "public_key_path" {
  description = "Path to the public key file for SSH access"
  default     = "nginx-server.key.pub"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  default     = 2
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instances"
  default     = "ami-0e2c8caa4b6378d8c"
}

variable "project_tags" {
  description = "Common tags for resources"
  type        = map(string)
  default = {
    Environment = "test"
    Owner       = "pabloackerm@gmail.com"
    Team        = "DevOps"
    Project     = "loadbalancer-ec2"
  }
}