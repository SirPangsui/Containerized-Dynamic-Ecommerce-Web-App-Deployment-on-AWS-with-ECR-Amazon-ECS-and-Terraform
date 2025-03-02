# ACM Variables
variable "domain_name" {
  description = "The primary domain name for the SSL/TLS certificate (e.g., example.com)"
  type        = string
}

variable "alternative_domain_name" {
  description = "An optional alternative domain name (e.g., www.example.com) for the certificate"
  type        = string
}
