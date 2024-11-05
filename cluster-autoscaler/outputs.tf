output "autoscaler_role_arn" {
  description = "ARN of the IAM role created for the Cluster Autoscaler"
  value       = module.cluster_autoscaler_irsa_role.iam_role_arn
}

output "autoscaler_role_name" {
  description = "Name of the IAM role created for the Cluster Autoscaler"
  value       = module.cluster_autoscaler_irsa_role.iam_role_name
}
