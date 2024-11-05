variable "namespace" {
  description = "Kubernetes namespace to deploy the ingress controller"
  type        = string
  default     = "ingress-nginx"
}

variable "helm_chart_version" {
  description = "Version of the NGINX Ingress Controller Helm chart"
  type        = string
  default     = "4.7.0"
}

variable "service_type" {
  description = "Type of Kubernetes service for the ingress controller"
  type        = string
  default     = "NodePort"
}

variable "http_nodeport" {
  description = "NodePort for HTTP traffic"
  type        = number
  default     = 30080
}

variable "target_group_arn" {
  description = "ARN of the ALB target group"
  type        = string
}
