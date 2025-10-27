variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t3.medium"  
}

variable "subnet_id" {
  description = "The public subnet ID where the EC2 instance will be launched"
  type        = string
  default     = "subnet-0852a4e422a2ea812"
}

variable "vpc_id" {
  description = "The ID of the existing VPC to deploy the EC2 instance into"
  type        = string
  default     = "vpc-0b110d239f1211b4d"
}

variable "my_ip" {
  description = "Your public IP address to allow SSH access"
  type        = string
  default     = "146.185.57.74/32" 
}

