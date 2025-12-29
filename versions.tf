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
      source  = "Infomaniak/infomaniak"
      version = "1.3.6"
    }
  }

  # ========================================
  # BACKEND CONFIGURATION
  # ========================================
  # Uncomment the desired backend and comment others
  
  # Backend 1: Terraform Cloud (recommended for CI/CD)
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "netarchitect"
    workspaces {
      name = "dns-infrastructure"
    }
  }

  # Backend 2: Local Storage (development only)
  # backend "local" {
  #   path = "./terraform.tfstate"
  # }

  # Backend 3: OVH Object Storage
  # backend "s3" {
  #   bucket         = "terraform-state-netarchitect"
  #   key            = "dns-infra/terraform.tfstate"
  #   region         = "GRA"
  #   endpoint       = "s3.gra.io.cloud.ovh.net"
  #   encrypt        = true
  #   skip_credentials_validation = true
  #   skip_region_validation      = true
  #   skip_requesting_account_id  = true
  #   skip_metadata_api_check     = true
  # }

  # Backend 4: AWS S3
  # backend "s3" {
  #   bucket         = "terraform-state-netarchitect"
  #   key            = "dns-infra/terraform.tfstate"
  #   region         = "us-east-1"
  #   encrypt        = true
  #   dynamodb_table = "terraform-locks"
  # }

  # Backend 5: Azure Blob Storage
  # backend "azurerm" {
  #   resource_group_name  = "terraform-rg"
  #   storage_account_name = "terraformstate"
  #   container_name       = "tfstate"
  #   key                  = "dns-infra/terraform.tfstate"
  # }

  # Backend 6: Google Cloud Storage
  # backend "gcs" {
  #   bucket = "terraform-state-netarchitect"
  #   prefix = "dns-infra/terraform.tfstate"
  # }
}