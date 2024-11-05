variable "ingress_host" {
  description = "Hostname for the ArgoCD ingress"
  type        = string
}

# modules/argocd/versions.tf
terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.14.0"
    }
  }
  required_version = ">= 1.0.0"
}