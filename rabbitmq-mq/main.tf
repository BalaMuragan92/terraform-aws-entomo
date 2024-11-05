module "mq_broker" {
  source  = "cloudposse/mq-broker/aws"
  version = "3.1.0"

  name                       = var.environment
  deployment_mode            = var.deployment_mode
  auto_minor_version_upgrade = var.auto_minor_version_upgrade
  engine_type               = "RabbitMQ"
  engine_version            = var.engine_version
  host_instance_type        = var.instance_type
  publicly_accessible       = var.publicly_accessible
  vpc_id                    = var.vpc_id
  subnet_ids                = [var.subnet_id]
  create_security_group     = false
  audit_log_enabled         = var.audit_log_enabled
  
  # User configuration
  mq_application_user     = [var.environment]
  mq_application_password = [var.mq_password]
}