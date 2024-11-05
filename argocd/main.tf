resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  version          = "5.36.10"
  create_namespace = true

  set {
    name  = "configs.params.server\\.insecure"
    value = true
  }

  set {
    name  = "dex.enabled"
    value = false
  }
}

resource "kubectl_manifest" "argocd_ingress" {
  depends_on = [helm_release.argocd]
  yaml_body  = yamlencode({
    apiVersion = "networking.k8s.io/v1"
    kind       = "Ingress"
    metadata = {
      name      = "argocd-server-ingress"
      namespace = "argocd"
      annotations = {
        "nginx.ingress.kubernetes.io/backend-protocol" = "HTTP"
      }
    }
    spec = {
      ingressClassName = "nginx"
      rules = [
        {
          host = var.ingress_host
          http = {
            paths = [
              {
                path     = "/"
                pathType = "Prefix"
                backend = {
                  service = {
                    name = "argocd-server"
                    port = {
                      name = "http"
                    }
                  }
                }
              }
            ]
          }
        }
      ]
    }
  })
}