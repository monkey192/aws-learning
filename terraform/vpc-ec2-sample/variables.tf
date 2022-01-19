variable "region" {
  type        = string
  default     = "ap-northeast-1"
  description = "AWS region"
}

variable "env_name" {
  type        = string
  description = "Environment name"
  default     = "dev"
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "availability_zone_names" {
  type    = list(string)
  default = ["ap-northeast-1a", "ap-northeast-1b", "ap-northeast-1c"]
}


variable "subnet_public_cidr_block" {
  type        = string
  default     = "10.0.0.0/24"
  description = "CIDR block of Public subnet"
}

variable "subnet_private_cidr_block" {
  type        = string
  default     = "10.0.1.0/24"
  description = "CIDR block of private subnet"
}

# EC2
variable "instance_image_id" {
  type    = string
  default = "ami-032d6db78f84e8bf5"
}