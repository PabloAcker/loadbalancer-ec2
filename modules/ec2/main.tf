resource "aws_key_pair" "nginx_ssh" {
  key_name   = "nginx-server-ssh"
  public_key = file(var.public_key_path)
}

resource "aws_instance" "nginx" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = aws_key_pair.nginx_ssh.key_name

  vpc_security_group_ids = [var.security_group_id]

  tags = merge(var.project_tags, {
    Name = "Upb-Nginx-${count.index}"
  })

  user_data = <<-EOF
              #!/bin/bash
              sudo yum install -y nginx
              sudo systemctl enable nginx
              sudo systemctl start nginx
              EOF
}