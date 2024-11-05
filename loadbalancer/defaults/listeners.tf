locals {
  default_https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      target_group_index = 0
      certificate_arn    = "arn:aws:acm:ap-southeast-3:891347655196:certificate/626ba94e-91d7-48d0-8926-251c14afc8b6"
    }
  ]

  default_http_tcp_listeners = [
    {
      port        = 80
      protocol    = "HTTP"
      action_type = "redirect"
      redirect = {
        port        = "443"
        protocol    = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]
}