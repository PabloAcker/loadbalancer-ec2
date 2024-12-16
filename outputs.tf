output "elb_dns_name" {
  description = "DNS name of the load balancer"
  value       = module.elb.elb_dns_name
}

output "instance_ips" {
  description = "IP addresses of the EC2 instances"
  value       = module.ec2.instance_ips
}