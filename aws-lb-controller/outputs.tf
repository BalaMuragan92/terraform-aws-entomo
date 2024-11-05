output "irsa_role_arn" {
  description = "ARN of the IRSA role"
  value       = module.aws_load_balancer_controller_irsa_role.iam_role_arn
}

output "irsa_role_name" {
  description = "Name of the IRSA role"
  value       = module.aws_load_balancer_controller_irsa_role.iam_role_name
}

output "service_account_name" {
  description = "Name of the service account"
  value       = "aws-load-balancer-controller"
}
