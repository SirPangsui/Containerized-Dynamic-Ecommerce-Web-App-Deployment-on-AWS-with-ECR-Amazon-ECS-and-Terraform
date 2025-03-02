# Security Group Variables
variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
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

variable "database_snapshot_id" {
  description = "ID of the RDS database snapshot used for restoring prepopulated data"
  type        = string
}

variable "database_instance_class" {
  description = "The instance type for the RDS database (e.g., db.t3.micro, db.m5.large)"
  type        = string
}

variable "availability_zone_1" {
  description = "The first availability zone where the primary database instance will be deployed"
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

variable "database_security_group_id" {
  description = "ID of the security group associated with the database instance"
  type        = string
}
