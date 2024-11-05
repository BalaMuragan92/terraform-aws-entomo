output "argocd_namespace" {
  description = "The namespace where ArgoCD is deployed"
  value       = helm_release.argocd.namespace
}

output "ingress_hostname" {
  description = "The hostname configured for ArgoCD ingress"
  value       = var.ingress_host
}