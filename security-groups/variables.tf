# Security Group Variables

variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC created in the VPC module"
  type        = string
}


variable "ssh_ip" {
  description = "This is IP allowed to SSH to your instances which will be your ip"
  type        = string
}