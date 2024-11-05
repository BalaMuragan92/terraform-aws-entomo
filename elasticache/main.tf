module "elasticache-redis" {
  source  = "cloudposse/elasticache-redis/aws"
  version = "0.52.0"
  
  vpc_id  = var.vpc_id
  
  name                       = var.environment
  availability_zones         = var.availability_zones
  subnets                    = var.subnets
  instance_type              = var.instance_type
  cluster_mode_enabled       = false
  apply_immediately          = true
  automatic_failover_enabled = false
  engine_version             = "7.0"
  family                     = "redis7"
  security_group_name        = ["${var.environment}-elasticache"]
  transit_encryption_enabled = false
  allowed_security_group_ids = var.allowed_security_group_ids
}