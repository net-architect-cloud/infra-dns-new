terraform {
  required_version = ">= 1.7.0"

  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 5.11"
    }
    ovh = {
      source  = "ovh/ovh"
      version = "~> 2.0"
    }
    infomaniak = {
      source  = "infomaniak/infomaniak"
      version = "~> 2.0"
    }
  }

  # Backend Configuration - Local Storage (Default)
  # For other backend options, see: ./backends/README.md
  backend "local" {
    path = "./terraform.tfstate"
  }

  # Alternative Backends (uncomment to use):
  # backend "s3" { ... }               # Cloudflare R2
  # backend "remote" { ... }           # Terraform Cloud
  # backend "s3" { ... }               # AWS S3
  # backend "azurerm" { ... }           # Azure Blob Storage
  # backend "gcs" { ... }              # Google Cloud Storage
}