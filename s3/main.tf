module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "3.14.0"

  bucket_prefix = "${var.environment}-"
  force_destroy = var.force_destroy

  # Adding common S3 configuration options that are often needed
  versioning = {
    enabled = var.enable_versioning
  }

  # Server-side encryption configuration
  server_side_encryption_configuration = {
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
  }

  # Block public access
  block_public_acls       = var.block_public_access
  block_public_policy     = var.block_public_access
  ignore_public_acls      = var.block_public_access
  restrict_public_buckets = var.block_public_access

  tags = {
    Environment = var.environment
    Managed_by  = "terraform"
  }
}