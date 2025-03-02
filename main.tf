locals {
  region       = var.region
  project_name = var.project_name
  environment  = var.environment
}

#Create VPC Module
module "vpc" {
  source                       = "./vpc"
  region                       = var.region
  project_name                 = var.project_name
  environment                  = var.environment
  vpc_cidr                     = var.vpc_cidr
  public_subnet_az1_cidr       = var.public_subnet_az1_cidr
  public_subnet_az2_cidr       = var.public_subnet_az2_cidr
  private_app_subnet_az1_cidr  = var.private_app_subnet_az1_cidr
  private_app_subnet_az2_cidr  = var.private_app_subnet_az2_cidr
  private_data_subnet_az1_cidr = var.private_data_subnet_az1_cidr
  private_data_subnet_az2_cidr = var.private_data_subnet_az2_cidr
}


#Create Nat Gateway Module
module "nat-gateway" {
  source                     = "./nat-gateway"
  project_name               = var.project_name
  environment                = var.environment
  public_subnet_az1_id       = module.vpc.public_subnet_az1_id
  public_subnet_az2_id       = module.vpc.public_subnet_az2_id
  internet_gateway           = module.vpc.internet_gateway
  vpc_id                     = module.vpc.vpc_id
  private_app_subnet_az1_id  = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id  = module.vpc.private_app_subnet_az2_id
  private_data_subnet_az1_id = module.vpc.private_data_subnet_az1_id
  private_data_subnet_az2_id = module.vpc.private_data_subnet_az2_id
}

# Create Security Group Module
module "security-group" {
  source       = "./security-groups"
  project_name = var.project_name
  environment  = var.environment
  vpc_id       = module.vpc.vpc_id
  ssh_ip       = var.ssh_ip
}

module "rds" {
  source                       = "./rds"
  project_name                 = var.project_name
  environment                  = var.environment
  private_data_subnet_az1_id   = module.vpc.private_data_subnet_az1_id
  private_data_subnet_az2_id   = module.vpc.private_data_subnet_az2_id
  database_snapshot_id         = var.database_snapshot_id
  database_instance_class      = var.database_instance_class
  availability_zone_1          = module.vpc.availability_zone_1
  database_instance_identifier = var.database_instance_identifier
  multi_az_deployment          = var.multi_az_deployment
  database_security_group_id   = module.security-group.database_security_group_id
}

#Request SSL Certificate
module "ssl_certificate" {
  source                  = "./acm"
  domain_name             = var.domain_name
  alternative_domain_name = var.alternative_domain_name
}

#Application Load Balancer Module
module "alb" {
  source                = "./alb"
  project_name          = var.project_name
  environment           = var.environment
  vpc_id                = module.vpc.vpc_id
  public_subnet_az1_id  = module.vpc.public_subnet_az1_id
  public_subnet_az2_id  = module.vpc.public_subnet_az2_id
  certificate_arn       = module.ssl_certificate.certificate_arn
  alb_security_group_id = module.security-group.alb_security_group_id
  target_type           = var.target_type
}

#S3 Bucket Module for creating and uploading the env file
module "s3_env_bucket" {
  source               = "./s3"
  project_name         = var.project_name
  env_file_name        = var.env_file_name
  env_file_bucket_name = var.env_file_bucket_name
}

#IAM Module for Creating Role for ECS
module "ecs_task_execution_role" {
  source               = "./iam-roles"
  project_name         = var.project_name
  environment          = var.environment
  env_file_bucket_name = module.s3_env_bucket.env_file_bucket_name
}

#ECS Module for creating ECS Cluster, Task Definition and Service
module "ecs-cluster" {
  source                       = "./ecs"
  region                       = var.region
  environment                  = var.environment
  project_name                 = var.project_name
  ecs_task_execution_role_arn  = module.ecs_task_execution_role.ecs_task_execution_role_arn
  cpu_architecture             = var.cpu_architecture
  container_image              = var.container_image
  env_file_bucket_name         = module.s3_env_bucket.env_file_bucket_name
  env_file_name                = module.s3_env_bucket.env_file_name
  container_desired_count      = var.container_desired_count
  private_app_subnet_az1_id    = module.vpc.private_app_subnet_az1_id
  private_app_subnet_az2_id    = module.vpc.private_app_subnet_az2_id
  app_server_security_group_id = module.security-group.app_server_security_group_id
  alb_target_group_arn         = module.alb.alb_target_group_arn
  container_port               = var.container_port
}

#Autoscaling Group for ECS Service
module "ecs-asg" {
  source       = "./asg-ecs"
  project_name = var.project_name
  environment  = var.environment
  ecs_service  = module.ecs-cluster.ecs_service
}

# Create Record set in route 53
module "route_53" {
  source = "./route-53"
  application_load_balancer_dns_name = module.alb.application_load_balancer_dns_name
  application_load_balancer_zone_id =  module.alb.application_load_balancer_zone_id
  record_name = var.record_name
  domain_name = module.ssl_certificate.domain_name
}


#print the website url
output "website_url" {
  value = join("", ["https://", var.record_name, ".", var.domain_name])
}