output "endpoint" {
  description = "Primary SSL endpoint of the broker"
  value       = module.mq_broker.primary_ssl_endpoint
}

output "web_console_url" {
  description = "URL of the broker's web console"
  value       = module.mq_broker.primary_console_url
}

output "broker_id" {
  description = "ID of the broker"
  value       = module.mq_broker.broker_id
}

output "broker_arn" {
  description = "ARN of the broker"
  value       = module.mq_broker.broker_arn
}

output "application_username" {
  description = "Username of the application user"
  value       = var.environment
}