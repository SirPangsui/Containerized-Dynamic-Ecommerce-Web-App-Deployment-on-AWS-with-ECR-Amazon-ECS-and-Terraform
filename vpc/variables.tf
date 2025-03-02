# Environment Variables
variable "region" {
  description = "The AWS region where resources will be deployed (e.g., us-east-1, eu-west-1)"
  type        = string
}

variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

# VPC Variables
variable "vpc_cidr" {
  description = "The CIDR block for the VPC (e.g., 10.0.0.0/16)"
  type        = string
}

variable "public_subnet_az1_cidr" {
  description = "CIDR block for the first public subnet in Availability Zone 1"
  type        = string
}

variable "public_subnet_az2_cidr" {
  description = "CIDR block for the second public subnet in Availability Zone 2"
  type        = string
}

variable "private_app_subnet_az1_cidr" {
  description = "CIDR block for the first private application subnet in Availability Zone 1"
  type        = string
}

variable "private_app_subnet_az2_cidr" {
  description = "CIDR block for the second private application subnet in Availability Zone 2"
  type        = string
}

variable "private_data_subnet_az1_cidr" {
  description = "CIDR block for the first private data subnet in Availability Zone 1"
  type        = string
}

variable "private_data_subnet_az2_cidr" {
  description = "CIDR block for the second private data subnet in Availability Zone 2"
  type        = string
}

