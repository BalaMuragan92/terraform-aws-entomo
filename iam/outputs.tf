output "service_account_role_arn" {
  description = "ARN of the service account IAM role"
  value       = module.iam_eks_role.iam_role_arn
}

output "s3_policy_arn" {
  description = "ARN of the S3 IAM policy"
  value       = module.s3_iam_policy.arn
}

output "role_name" {
  description = "Name of the IAM role"
  value       = module.iam_eks_role.iam_role_name
}