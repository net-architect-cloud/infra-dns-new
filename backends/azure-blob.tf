# Azure Blob Storage Backend Configuration
# Replace this backend configuration in versions.tf to use Azure Blob Storage

terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-storage-rg"  # Replace with your resource group
    storage_account_name = "terraformstatesa"      # Replace with your storage account
    container_name       = "terraform-state"       # Replace with your container name
    key                  = "dns-infra/terraform.tfstate"
  }
}

# Required environment variables:
# export ARM_CLIENT_ID="your_azure_client_id"
# export ARM_CLIENT_SECRET="your_azure_client_secret"
# export ARM_SUBSCRIPTION_ID="your_azure_subscription_id"
# export ARM_TENANT_ID="your_azure_tenant_id"
