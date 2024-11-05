variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "public_subnets" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "security_groups" {
  description = "List of security group IDs"
  type        = list(string)
}

variable "security_group_rules" {
  description = "Security group rules"
  type        = map(any)
  default     = null # Will use defaults from security_groups.tf
}

variable "target_groups" {
  description = "List of target groups"
  type        = any
  default     = null # Will use defaults from target_groups.tf
}

variable "https_listeners" {
  description = "List of HTTPS listeners"
  type        = any
  default     = null # Will use defaults from listeners.tf
}

variable "http_tcp_listeners" {
  description = "List of HTTP listeners"
  type        = any
  default     = null # Will use defaults from listeners.tf
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}