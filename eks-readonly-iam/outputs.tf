output "read_only_role_arn" {
  description = "ARN of the EKS read-only IAM role"
  value       = module.eks_read_only_iam_role.iam_role_arn
}

output "read_only_role_name" {
  description = "Name of the EKS read-only IAM role"
  value       = module.eks_read_only_iam_role.iam_role_name
}

output "read_only_group_name" {
  description = "Name of the EKS read-only IAM group"
  value       = module.eks_read_only_iam_group.group_name
}