data "aws_route53_zone" "selected" {
  name         = var.domain_name
  private_zone = false
  provider     = aws.prod
}

module "dns_records" {
  source = "terraform-aws-modules/route53/aws//modules/records"
  
  providers = {
    aws = aws.prod
  }

  zone_id = data.aws_route53_zone.selected.zone_id
  
  records = [
    for sub in var.subdomains : {
      name    = sub
      type    = "CNAME"
      ttl     = var.record_ttl
      records = [var.alb_dns_name]
    }
  ]
}