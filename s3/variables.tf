#S3 Variables
variable "project_name" {
  description = "The name of the project to be used for tagging resources"
  type        = string
}

variable "env_file_bucket_name" {
  description = "The bucket name for the env file"
  type        = string
}
variable "env_file_name" {
  description = "The  name of the env file to upload to the bucket"
  type        = string
}