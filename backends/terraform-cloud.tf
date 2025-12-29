# Terraform Cloud Backend Configuration
# Replace this backend configuration in versions.tf to use Terraform Cloud

terraform {
  backend "remote" {
    organization = "your-organization-name"  # Replace with your Terraform Cloud org
    
    workspaces {
      name = "dns-infrastructure"  # Replace with your workspace name
    }
  }
}

# Required environment variables:
# export TF_TOKEN_app_terraform_io="your_terraform_cloud_token"
# export TF_CLOUD_ORGANIZATION="your-organization-name"
