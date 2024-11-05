variable "environment" {
  description = "Environment name used for the bucket prefix"
  type        = string
}

variable "force_destroy" {
  description = "Whether to force destroy the bucket even if it contains objects"
  type        = bool
  default     = true
}

variable "enable_versioning" {
  description = "Enable versioning on the bucket"
  type        = bool
  default     = false
}

variable "block_public_access" {
  description = "Whether to block all public access to the bucket"
  type        = bool
  default     = true
}