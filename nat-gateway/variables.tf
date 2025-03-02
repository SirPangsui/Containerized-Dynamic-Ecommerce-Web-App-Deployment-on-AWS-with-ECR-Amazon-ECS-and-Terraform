# Nat-Gateway Variables

variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "public_subnet_az1_id" {
  description = "ID of the first public subnet in Availability Zone 1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "ID of the second public subnet in Availability Zone 2"
  type        = string
}

variable "internet_gateway" {
  description = "ID of the internet gateway created in the VPC module"
}

variable "vpc_id" {
  description = "ID of the VPC created in the VPC module"
  type        = string
}

variable "private_app_subnet_az1_id" {
  description = "ID of the first private application subnet in Availability Zone 1"
  type        = string
}

variable "private_app_subnet_az2_id" {
  description = "ID of the second private application subnet in Availability Zone 2"
  type        = string
}

variable "private_data_subnet_az1_id" {
  description = "ID of the first private data subnet in Availability Zone 1"
  type        = string
}

variable "private_data_subnet_az2_id" {
  description = "ID of the second private data subnet in Availability Zone 2"
  type        = string
}
