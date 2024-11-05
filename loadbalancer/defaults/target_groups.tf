locals {
  default_target_groups = [
    {
      name_prefix      = "tggrp-"
      backend_protocol = "HTTP"
      backend_port     = 30080
      target_type      = "instance"
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol           = "HTTP"
        matcher            = "200-399"
      }
    }
  ]
}