variable "release_name" {
  description = "Name of the Helm release"
  type        = string
  default     = "metrics-server"
}

variable "repository_url" {
  description = "URL of the Helm chart repository"
  type        = string
  default     = "https://kubernetes-sigs.github.io/metrics-server/"
}

variable "chart_name" {
  description = "Name of the Helm chart"
  type        = string
  default     = "metrics-server"
}

variable "namespace" {
  description = "Kubernetes namespace to install the release into"
  type        = string
  default     = "kube-system"
}

variable "chart_version" {
  description = "Version of the Helm chart"
  type        = string
  default     = "3.10.0"
}

variable "create_namespace" {
  description = "Create the namespace if it does not exist"
  type        = bool
  default     = false
}

variable "atomic" {
  description = "If true, installation process rolls back changes made in case of failed installation"
  type        = bool
  default     = true
}

variable "cleanup_on_fail" {
  description = "Allow deletion of new resources created in this installation when it fails"
  type        = bool
  default     = true
}

variable "timeout" {
  description = "Time in seconds to wait for any individual kubernetes operation"
  type        = number
  default     = 300
}

variable "values_file" {
  description = "Path to values file for the Helm chart"
  type        = string
  default     = null
}

variable "additional_set_values" {
  description = "Additional values to set on the Helm release"
  type = list(object({
    name  = string
    value = string
    type  = optional(string)
  }))
  default = []
}