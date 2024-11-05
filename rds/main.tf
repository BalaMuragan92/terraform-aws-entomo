data "aws_availability_zones" "available" {}

module "db" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.0.0"

  identifier = var.environment

  engine               = "mariadb"
  engine_version       = "10.4.26"
  major_engine_version = "10.4"
  family               = "mariadb10.4"
  instance_class       = "db.t3.medium"

  allocated_storage     = 500
  max_allocated_storage = 1000

  username                    = "admin"
  password                    = var.db_password
  manage_master_user_password = false
  port                        = 3306
  publicly_accessible         = true

  multi_az               = false
  db_subnet_group_name   = var.db_subnet_group_name
  vpc_security_group_ids = [module.security_group.security_group_id]

  skip_final_snapshot         = false
  create_db_option_group      = false
  create_db_parameter_group   = true
  parameter_group_description = "${var.environment} parameter group"
  parameter_group_name        = var.environment
  snapshot_identifier         = var.db_snapshot_identifier

  performance_insights_enabled          = true
  performance_insights_retention_period = 7
  monitoring_interval                   = 60
  monitoring_role_arn                   = "arn:aws:iam::891347655196:role/rds-monitoring-role"

  parameters = [
    {
      name  = "long_query_time"
      value = "0"
    },
    {
      name  = "log_queries_not_using_indexes"
      value = "1"
    }
  ]

  tags = {
    env = var.environment
  }
}

module "security_group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "5.1.0"

  name        = var.environment
  description = "${var.environment} security group"
  vpc_id      = var.vpc_id

  ingress_with_cidr_blocks = [
    {
      from_port   = 3306
      to_port     = 3306
      protocol    = "tcp"
      description = "MariaDB access from within VPC"
      cidr_blocks = var.vpc_cidr_block
    },
  ]

  tags = {
    env = var.environment
  }
}