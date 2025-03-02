#ECS ASG Variables
variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "environment" {
  description = "The deployment environment (e.g., dev, staging, prod)"
  type        = string
}

variable "ecs_service" {
  description = "Stores the Information for the ECS Service"
}
