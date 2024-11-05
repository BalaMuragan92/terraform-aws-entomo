variable "environment" {
  description = "Environment name"
  type        = string
}

variable "eks_oidc_provider_arn" {
  description = "EKS OIDC provider ARN"
  type        = string
}

variable "service_account_namespaces" {
  description = "List of Kubernetes service account namespaces"
  type        = list(string)
  default     = ["*:skylark"]
}

variable "s3_bucket_arn" {
  description = "ARN of the S3 bucket"
  type        = string
}

variable "s3_policy_actions" {
  description = "List of S3 actions to allow"
  type        = list(string)
  default     = ["s3:*"]
}