# store the terraform state file in s3 and lock with dynamodb
terraform {
  backend "s3" {
    bucket         = "your_bucket_name"
    key            = "your_state_file.tfstate"
    region         = "your_region"
    profile        = "your_aws_profile"
    dynamodb_table = "your_dynamodb_table"
  }
}
