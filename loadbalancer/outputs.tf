output "alb_dns_name" {
  description = "ALB DNS name"
  value       = module.alb.lb_dns_name
}

output "alb_arn" {
  description = "ALB ARN"
  value       = module.alb.lb_arn
}

output "target_group_arns" {
  description = "Target Group ARNs"
  value       = module.alb.target_group_arns
}

output "https_listener_arns" {
  description = "HTTPS Listener ARNs"
  value       = module.alb.https_listener_arns
}