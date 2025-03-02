provider "aws" {
  region  = var.region
  profile = "your_cli_profile_name"

  default_tags {
    tags = {
      "Automation"  = "terraform"
      "Project"     = var.project_name
      "Environment" = var.environment
    }
  }
}