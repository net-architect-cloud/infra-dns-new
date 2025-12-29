# Google Cloud Storage Backend Configuration
# Replace this backend configuration in versions.tf to use Google Cloud Storage

terraform {
  backend "gcs" {
    bucket = "terraform-state-bucket"  # Replace with your GCS bucket name
    prefix = "dns-infra/terraform"
  }
}

# Required environment variables:
# export GOOGLE_APPLICATION_CREDENTIALS="path/to/service-account.json"
# export GOOGLE_CLOUD_PROJECT="your-project-id"
# export GOOGLE_REGION="us-central1"
