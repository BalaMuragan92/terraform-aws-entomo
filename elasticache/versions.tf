terraform {
  required_providers {
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.0.0"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.0.0"
    }
  }
  required_version = ">= 1.0.0"
}