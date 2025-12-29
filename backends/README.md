# Backend Options for Terraform State Storage

This directory contains different backend configurations for storing Terraform state files.

## Available Backends

### 1. **Cloudflare R2** (Default)
- **File**: `../versions.tf` (current configuration)
- **Use case**: Cost-effective, S3-compatible storage
- **Features**: Encrypted storage, global CDN

### 2. **Terraform Cloud** (HashiCorp Cloud)
- **File**: `terraform-cloud.tf`
- **Use case**: Managed service with collaboration features
- **Features**: Remote operations, policy as code, audit logs

### 3. **AWS S3**
- **File**: `aws-s3.tf`
- **Use case**: AWS ecosystem integration
- **Features**: State locking with DynamoDB, versioning

### 4. **Azure Blob Storage**
- **File**: `azure-blob.tf`
- **Use case**: Azure ecosystem integration
- **Features**: Soft delete, immutable storage

### 5. **Google Cloud Storage**
- **File**: `gcs.tf`
- **Use case**: GCP ecosystem integration
- **Features**: Uniform bucket-level access, versioning

### 6. **Local Storage**
- **File**: `local.tf`
- **Use case**: Development and testing only
- **Features**: No external dependencies

## How to Switch Backends

1. **Copy the desired backend configuration** from this directory
2. **Replace the backend block** in `../versions.tf`
3. **Configure required environment variables**
4. **Run `terraform init`** to migrate the state

## Environment Variables

Each backend requires specific environment variables. See individual backend files for details.

## Recommendations

- **Production**: Terraform Cloud or AWS S3 with DynamoDB
- **Development**: Local backend
- **Cost-effective**: Cloudflare R2 (current default)
- **Cloud-specific**: Choose backend matching your primary cloud provider
