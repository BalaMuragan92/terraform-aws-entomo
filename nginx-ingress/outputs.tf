output "release_name" {
  description = "Name of the Helm release"
  value       = helm_release.ingress_nginx.name
}

output "release_namespace" {
  description = "Namespace of the Helm release"
  value       = helm_release.ingress_nginx.namespace
}

output "service_name" {
  description = "Name of the ingress controller service"
  value       = "ingress-nginx-controller"
}

output "target_group_binding_name" {
  description = "Name of the Target Group Binding"
  value       = "nginx-tgb"
}