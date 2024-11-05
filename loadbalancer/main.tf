module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.7.0"

  name = var.environment
  load_balancer_type = "application"

  vpc_id          = var.vpc_id
  subnets         = var.public_subnets
  security_groups = var.security_groups

  security_group_rules = var.security_group_rules
  target_groups       = var.target_groups
  https_listeners     = var.https_listeners
  http_tcp_listeners  = var.http_tcp_listeners

  tags = var.tags
}