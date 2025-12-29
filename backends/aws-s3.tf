# AWS S3 Backend Configuration
# Replace this backend configuration in versions.tf to use AWS S3

terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"  # Replace with your S3 bucket name
    key            = "dns-infra/terraform.tfstate"
    region         = "us-east-1"                     # Replace with your AWS region
    encrypt        = true
    dynamodb_table = "terraform-locks"             # Optional: for state locking
  }
}

# Required environment variables:
# export AWS_ACCESS_KEY_ID="your_aws_access_key"
# export AWS_SECRET_ACCESS_KEY="your_aws_secret_key"
# export AWS_DEFAULT_REGION="us-east-1"
