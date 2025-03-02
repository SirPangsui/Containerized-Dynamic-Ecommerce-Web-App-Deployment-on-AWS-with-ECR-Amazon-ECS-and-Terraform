# Route53 Variables
variable "domain_name" {
  description = "The primary domain name for the project"
  type        = string
}

variable "record_name" {
  description = "The record name for route 53 record"
  type        = string
}

variable "application_load_balancer_dns_name" {
  description = "The application load balancer dns name"
  type        = string
}

variable "application_load_balancer_zone_id" {
  type        = string
  description = "The application load balancer zone id"
}