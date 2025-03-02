# ECS Cluster Variables

variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "ecs_task_execution_role_arn" {
  description = "The ARN of the ECS task execution role, which allows ECS tasks to interact with AWS services"
  type        = string
}

variable "cpu_architecture" {
  description = "The CPU architecture of the ECS task (e.g., x86_64 or ARM64)"
  type        = string
}

variable "container_image" {
  description = "The container image URI to be used for deploying the application"
  type        = string
}

variable "env_file_bucket_name" {
  description = "The S3 bucket name where the environment variables file is stored"
  type        = string
}

variable "env_file_name" {
  description = "The name of the environment variables file to be uploaded to the S3 bucket"
  type        = string
}

variable "region" {
  description = "The AWS region where the resources will be deployed"
  type        = string
}

variable "container_desired_count" {
  description = "The desired number of running containers for the ECS service"
  type        = number
}

variable "private_app_subnet_az1_id" {
  description = "The ID of the first private application subnet in Availability Zone 1"
  type        = string
}

variable "private_app_subnet_az2_id" {
  description = "The ID of the second private application subnet in Availability Zone 2"
  type        = string
}

variable "app_server_security_group_id" {
  description = "The security group ID for the application server, controlling inbound and outbound traffic"
  type        = string
}

variable "alb_target_group_arn" {
  description = "The ARN of the Application Load Balancer (ALB) target group for routing traffic to the ECS service"
  type        = string
}

variable "container_port" {
  description = "The port on which the containerized application listens"
  type        = number
}
