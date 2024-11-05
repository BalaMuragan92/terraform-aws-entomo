variable "domain_name" {
  description = "The domain name of the Route53 hosted zone"
  type        = string
}

variable "subdomains" {
  description = "List of subdomains to create DNS records for"
  type        = list(string)
}

variable "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  type        = string
}

variable "record_ttl" {
  description = "TTL for DNS records in seconds"
  type        = number
  default     = 300
}