output "db_endpoint" {
  description = "Database endpoint"
  value       = module.db.db_instance_address
}

output "security_group_id" {
  description = "Security group ID"
  value       = module.security_group.security_group_id
}