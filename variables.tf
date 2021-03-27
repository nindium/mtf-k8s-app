variable "aws_region" {
  description = "Define AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_name" {
  description = "Define VPC name"
  type        = string
  default     = "VPC-TF"
}

variable "vpc_cidr" {
  description = "VPC subnet"
  type        = string
  default     = "10.0.0.0/16"
}

variable "default_cidr" {
  description = "Define default cidr"
  type        = string
  default     = "0.0.0.0/0"
}

variable "aws_az" {
    description = "Availability zone definition"
    type = string 
    default = "us-east-1a"

}

variable "desired_capacity" {
  description = "Define how many working nodes should we have"
  type        = number
  default     = 2
}

variable "ec2_key_name" {
    description = "EC2 key name"
    type = string
    default = "GenericKP"
}
