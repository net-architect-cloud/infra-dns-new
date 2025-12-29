# Backend Configuration File pour Terraform Cloud
# Utilisé avec : terraform init -backend-config=terraform-cloud.hcl

hostname = "app.terraform.io"
organization = "netarchitect"
workspaces = {
  name = "dns-infrastructure"
}
