output "endpoint" {
  description = "Redis endpoint address"
  value       = module.elasticache-redis.endpoint
}

output "port" {
  description = "Redis port"
  value       = module.elasticache-redis.port
}
