#ECS Task Execution Role Variables
variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "env_file_bucket_name" {
  description = "The bucket name for the env file"
  type        = string
}