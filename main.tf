module "security_group" {
  source = "./modules/security_group"
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  instance_count    = var.instance_count
  security_group_id = module.security_group.security_group_id
  public_key_path   = var.public_key_path
  project_tags      = var.project_tags
}

module "elb" {
  source         = "./modules/elb"
  instances      = module.ec2.instance_ids
  availability_zones = ["us-east-1a", "us-east-1b"]
  project_tags   = var.project_tags
}