output "admin_role_arn" {
  description = "ARN of the EKS admin IAM role"
  value       = module.eks_admin_iam_role.iam_role_arn
}

output "admin_role_name" {
  description = "Name of the EKS admin IAM role"
  value       = module.eks_admin_iam_role.iam_role_name
}

output "admin_group_name" {
  description = "Name of the EKS admin IAM group"
  value       = module.eks_admins_iam_group.group_name
}