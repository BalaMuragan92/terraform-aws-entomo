output "zone_id" {
  description = "The ID of the Route53 hosted zone"
  value       = data.aws_route53_zone.selected.zone_id
}

output "zone_name" {
  description = "The name of the Route53 hosted zone"
  value       = data.aws_route53_zone.selected.name
}

output "record_names" {
  description = "List of created DNS record names"
  value       = [for sub in var.subdomains : "${sub}.${var.domain_name}"]
}