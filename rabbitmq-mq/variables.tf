variable "environment" {
  description = "Environment name used for naming and user creation"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC where the broker will be deployed"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet where the broker will be deployed"
  type        = string
}

variable "mq_password" {
  description = "Password for the RabbitMQ application user"
  type        = string
  sensitive   = true
}

variable "deployment_mode" {
  description = "Deployment mode of the broker"
  type        = string
  default     = "SINGLE_INSTANCE"
}

variable "engine_version" {
  description = "Version of RabbitMQ engine"
  type        = string
  default     = "3.10.20"
}

variable "instance_type" {
  description = "Instance type of the broker"
  type        = string
  default     = "mq.t3.micro"
}

variable "publicly_accessible" {
  description = "Whether the broker should be publicly accessible"
  type        = bool
  default     = true
}

variable "auto_minor_version_upgrade" {
  description = "Enable automatic minor version upgrades"
  type        = bool
  default     = true
}

variable "audit_log_enabled" {
  description = "Enable audit logging"
  type        = bool
  default     = false
}