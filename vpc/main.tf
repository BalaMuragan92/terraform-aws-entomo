module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.0.0"

  name = var.environment
  cidr = var.vpc_cidr

  azs              = var.availability_zones
  private_subnets  = var.private_subnet_cidrs
  public_subnets   = var.public_subnet_cidrs
  database_subnets = var.database_subnet_cidrs

  public_subnet_tags = merge(
    var.public_subnet_tags,
    var.eks_cluster_tags ? {
      "kubernetes.io/role/elb" = "1"
    } : {}
  )

  private_subnet_tags = merge(
    var.private_subnet_tags,
    var.eks_cluster_tags ? {
      "kubernetes.io/role/internal-elb" = "1"
    } : {}
  )

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  create_database_subnet_group           = var.create_database_subnet_group
  create_database_subnet_route_table     = var.create_database_subnet_route_table
  create_database_internet_gateway_route = var.create_database_internet_gateway_route

  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support

  tags = merge(
    {
      Environment = var.environment
      Terraform   = "true"
    },
    var.additional_tags
  )
}