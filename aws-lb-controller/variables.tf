variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "oidc_provider_arn" {
  description = "ARN of the OIDC Provider associated with EKS cluster"
  type        = string
}

variable "namespace" {
  description = "Kubernetes namespace to deploy the controller"
  type        = string
  default     = "kube-system"
}

variable "helm_chart_version" {
  description = "Version of the AWS Load Balancer Controller Helm chart"
  type        = string
  default     = "1.5.4"
}

variable "replica_count" {
  description = "Number of controller pods to run"
  type        = number
  default     = 1
}

variable "enable_service_mutator_webhook" {
  description = "Enable service mutator webhook"
  type        = bool
  default     = false
}