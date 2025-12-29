# Local Backend Configuration (for development/testing only)
# Replace this backend configuration in versions.tf to use local storage

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

# No environment variables required
# WARNING: Not recommended for production or team collaboration
