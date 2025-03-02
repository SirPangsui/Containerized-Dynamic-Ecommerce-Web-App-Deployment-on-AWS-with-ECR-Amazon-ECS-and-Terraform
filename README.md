## Containerized Dynamic Ecommerce Web App Deployment on AWS with ECR, Amazon ECS, and Terraform

This project demonstrates the deployment of a **containerized Dynamic Ecommerce Web App** on AWS using **Docker, Amazon ECR, and Amazon ECS**. The infrastructure was provisioned using **Terraform**, leveraging a **three-tier architecture** for security and scalability. The architecture comprises a **public tier, an application tier, and a database tier**, ensuring isolation and security for different components.

![Alt text](/architecture.jpeg)

## Architecture Overview
The project follows a **three-tier architecture** that includes:
- **Public Tier**: Internet Gateway, NAT Gateway, and Application Load Balancer.
- **Application Tier**: ECS cluster hosting Docker containers running the application.
- **Database Tier**: Amazon RDS instance deployed in private subnets.

## AWS Services Utilized
The following **AWS services** were used to deploy and manage the application:

1. **Virtual Private Cloud (VPC):** Configured with both public and private subnets spanning two Availability Zones for high availability.
2. **Internet Gateway:** Enables communication between VPC instances and the wider internet.
3. **Security Groups:** Configured to act as a network firewall mechanism for access control.
4. **Multi-AZ Deployment:** Leveraged two Availability Zones for increased fault tolerance and reliability.
5. **Public Subnets:** Used for the NAT Gateway and Application Load Balancer.
6. **Amazon RDS:** Deployed in a private subnet for enhanced security.
7. **Bastion Host:** Used to establish an SSH tunnel for securely performing database migration to Amazon RDS.
8. **Docker and Amazon ECR:** Created a Dockerfile to build the application image, stored in an ECR repository.
9. **Amazon ECS:** Created an ECS cluster to host Docker container images from ECR.
10. **Private Subnets:** Containers were placed within private subnets for enhanced security.
11. **NAT Gateway:** Allowed containers in private subnets to access the internet.
12. **Amazon S3:** Used for storing environment variables for the ECS containers.
13. **IAM Roles:** Configured permissions for ECS to access environment variables in S3.
14. **Application Load Balancer & Target Group:** Distributed traffic across ECS containers in multiple Availability Zones.
15. **Auto Scaling Group:** Managed the number of containers dynamically, ensuring scalability, fault tolerance, and high availability.
16. **AWS Certificate Manager:** Secured communications by provisioning and managing SSL/TLS certificates.
17. **Amazon Route 53:** Configured DNS records and connected the domain name with AWS infrastructure.
18. **Terraform:** Used to define infrastructure as code (IaC) for automating deployment.
19. **Reusable Terraform Modules:** Created modular Terraform components for better scalability and reusability.

## Prerequisites
Before deploying this project, ensure you have the following prerequisites:

1. **Docker Image**
   - Build your Docker image and push it to the Amazon ECR repository.

2. **Amazon RDS Snapshot**
   - You need an RDS snapshot to restore an existing database and populate it with records.

## Repository Structure
The GitHub repository contains:
- 📌 **Reference Diagram**: High-level architecture diagram for understanding the system design.
- 📌 **Terraform Deployment Scripts**: Infrastructure as Code (IaC) scripts to provision AWS resources.
- 📌 **Dockerfile**: Used for building the container image.

## Deployment Steps
Follow these steps to deploy the infrastructure:

- Clone the GitHub repository.
- Update the terraform.tfvars file with your specific configuration values.
- Run terraform init to initialize the Terraform working directory.
- Run terraform plan to preview the changes that will be applied.
- Run terraform apply to deploy the infrastructure.
- Upload the Docker image to Amazon ECR.
- Ensure the ECS cluster is running the application container.
- Configure Route 53 with the appropriate domain name settings.
- Verify application availability using the Application Load Balancer.

## Conclusion

This project showcases a production-grade deployment of a containerized Dynamic Ecommerce Web App using AWS services and Terraform. By implementing a three-tier architecture, security best practices, and infrastructure as code, it ensures scalability, security, and high availability.
