# ALB Variables
variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "alb_security_group_id" {
  description = "The ID of the Application Load Balancer created in the Security Group Module"
  type = string
}


variable "public_subnet_az1_id" {
  description = "ID of the first public subnet in Availability Zone 1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "ID of the second public subnet in Availability Zone 2"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC created in the VPC module"
  type        = string
}

variable "target_type" {
   description = "The Target Type for the ALB"
  type        = string
}

variable "certificate_arn" {
   description = "ARN for Certificate Manager Certificate"
  type        = string
}