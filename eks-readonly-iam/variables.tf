variable "environment" {
  description = "Environment name used for resource naming"
  type        = string
}

variable "vpc_owner_id" {
  description = "AWS Account ID (VPC Owner ID)"
  type        = string
}

variable "eks_cluster_arn" {
  description = "ARN of the EKS cluster"
  type        = string
}

variable "read_only_users" {
  description = "List of IAM users to be added to the read-only group"
  type        = list(string)
}
