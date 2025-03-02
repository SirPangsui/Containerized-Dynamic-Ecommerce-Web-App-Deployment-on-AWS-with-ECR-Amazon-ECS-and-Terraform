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

# Security Group Variables
variable "ssh_ip" {
  description = "This is IP allowed to SSH to your instances which will be your ip"
  type        = string
}

# RDS Variables
variable "database_snapshot_id" {
  description = "ID of the RDS database snapshot used for restoring prepopulated data"
  type        = string
}

variable "database_instance_class" {
  description = "The instance type for the RDS database (e.g., db.t3.micro, db.m5.large)"
  type        = string
}

variable "database_instance_identifier" {
  description = "A unique identifier for the database instance"
  type        = string
}

variable "multi_az_deployment" {
  description = "Boolean flag to enable Multi-AZ deployment for high availability (true/false)"
  type        = bool
}


# ACM Variables
variable "domain_name" {
  description = "The primary domain name for the SSL/TLS certificate (e.g., example.com)"
  type        = string
}

variable "alternative_domain_name" {
  description = "An optional alternative domain name (e.g., www.example.com) for the certificate"
  type        = string
}

#ALB Variables
variable "target_type" {
  description = "The Target Type for the ALB"
  type        = string
}

#S3 Env Bucket Variables
variable "env_file_bucket_name" {
  description = "The bucket name for the env file"
  type        = string
}
variable "env_file_name" {
  description = "The  name of the env file to upload to the bucket"
  type        = string
}

# ECS Cluster Variables
variable "cpu_architecture" {
  description = "The CPU architecture of the ECS task (e.g., x86_64 or ARM64)"
  type        = string
}

variable "container_image" {
  description = "The container image URI to be used for deploying the application"
  type        = string
}

variable "container_port" {
  description = "The port on which the containerized application listens"
  type        = number
}

variable "container_desired_count" {
  description = "The desired number of running containers for the ECS service"
  type        = number
}

# Route 53 Variables
variable "record_name" {
  description = "The record name for route 53 record"
  type        = string
}