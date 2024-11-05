variable "environment" {
  description = "Environment name"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ElastiCache cluster will be deployed"
  type        = string
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-southeast-3a", "ap-southeast-3b"]
}

variable "subnets" {
  description = "List of subnet IDs for ElastiCache deployment"
  type        = list(string)
}

variable "instance_type" {
  description = "ElastiCache instance type"
  type        = string
  default     = "cache.t3.micro"
}

variable "allowed_security_group_ids" {
  description = "List of security group IDs allowed to access the ElastiCache cluster"
  type        = list(string)
}