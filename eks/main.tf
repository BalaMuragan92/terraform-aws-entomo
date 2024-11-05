module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "19.15.3"

  cluster_name    = var.environment
  cluster_version = var.cluster_version

  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  enable_irsa = true

  eks_managed_node_group_defaults = {
    disk_size = var.node_disk_size
  }

  eks_managed_node_groups = {
    medium = {
      desired_size = var.node_group_desired_size
      min_size     = var.node_group_min_size
      max_size     = var.node_group_max_size

      labels = {
        role = "medium"
      }

      instance_types = var.node_instance_types
      capacity_type  = var.node_capacity_type
    }
  }

  manage_aws_auth_configmap = true
  aws_auth_roles = var.aws_auth_roles

  node_security_group_additional_rules = {
    alb_to_nginx_ingress_controller = {
      description              = "ALB to Nginx Ingress Controller"
      protocol                 = "tcp"
      from_port                = 30080
      to_port                  = 30080
      type                     = "ingress"
      source_security_group_id = var.alb_security_group_id
    }
    node_to_node_ping = {
      description              = "Node to Node Ping"
      protocol                 = "icmp"
      from_port                = -1
      to_port                  = -1
      type                     = "ingress"
      source_security_group_id = module.eks.node_security_group_id
    }
    node_to_node_http = {
      description              = "Node to Node HTTP"
      protocol                 = "tcp"
      from_port                = 80
      to_port                  = 80
      type                     = "ingress"
      source_security_group_id = module.eks.node_security_group_id
    }
  }

  cluster_enabled_log_types = var.cluster_enabled_log_types

  cloudwatch_log_group_retention_in_days = var.log_retention_days

  tags = var.tags
}