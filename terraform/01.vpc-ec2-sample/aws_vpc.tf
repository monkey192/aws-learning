# Create VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    name = "my_vpc"
  }
}

# Create Public subnet
resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_public_cidr_block
  availability_zone = var.availability_zone_names[0]
  tags = {
    name = "public_subnet"
  }
}

# Create Private subnet
resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = var.subnet_private_cidr_block
  availability_zone = var.availability_zone_names[2]
  tags = {
    name = "private_subnet"
  }
}

# Internet gateway
resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id
  tags = {
    name = "my internet gateway"
  }
}

# Route table
resource "aws_route_table" "public_routetable" {
  vpc_id = aws_vpc.my_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    name = "public_subnet_route_table"
  }
}

# Route table association
resource "aws_route_table_association" "public_routetable_association" {
  route_table_id = aws_route_table.public_routetable.id
  subnet_id      = aws_subnet.public.id
}

resource "aws_security_group" "public_sg" {
  name   = "public-sg"
  vpc_id = aws_vpc.my_vpc.id
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}