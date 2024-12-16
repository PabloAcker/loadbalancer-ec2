output "instance_ids" {
  description = "List of EC2 instance IDs"
  value       = aws_instance.nginx[*].id
}

output "instance_ips" {
  description = "List of public IPs of the EC2 instances"
  value       = aws_instance.nginx[*].public_ip
}