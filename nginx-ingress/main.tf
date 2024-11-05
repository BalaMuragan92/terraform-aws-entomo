# NGINX Ingress Controller Helm Release
resource "helm_release" "ingress_nginx" {
  name = "ingress-nginx"

  repository       = "https://kubernetes.github.io/ingress-nginx"
  chart            = "ingress-nginx"
  namespace        = var.namespace
  version          = var.helm_chart_version
  create_namespace = true

  set {
    name  = "controller.service.type"
    value = var.service_type
  }

  set {
    name  = "controller.service.nodePorts.http"
    value = var.http_nodeport
  }
}

# Target Group Binding
resource "kubectl_manifest" "target_group_binding" {
  yaml_body = yamlencode({
    apiVersion = "elbv2.k8s.aws/v1beta1"
    kind       = "TargetGroupBinding"
    metadata = {
      name      = "nginx-tgb"
      namespace = var.namespace
    }
    spec = {
      serviceRef = {
        name = "ingress-nginx-controller"
        port = 80
      }
      targetGroupARN = var.target_group_arn
    }
  })
  depends_on = [helm_release.ingress_nginx]
}