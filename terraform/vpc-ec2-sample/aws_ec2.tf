resource "aws_instance" "my-ec2" {
  instance_type   = "t2.micro"
  ami             = var.instance_image_id
  subnet_id       = aws_subnet.public.id
  security_groups = [aws_security_group.public_sg.id]
  user_data       = <<EOF
#! /bin/bash
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
EOF
}

# Creare elastic IP
resource "aws_eip" "eip" {
  instance = aws_instance.my-ec2.id
  vpc      = true
}