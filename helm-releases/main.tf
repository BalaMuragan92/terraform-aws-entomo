resource "helm_release" "metrics_server" {
  name       = var.release_name
  repository = var.repository_url
  chart      = var.chart_name
  namespace  = var.namespace
  version    = var.chart_version

  # Added common configuration options
  create_namespace = var.create_namespace
  atomic          = var.atomic
  timeout         = var.timeout
  cleanup_on_fail = var.cleanup_on_fail

  # Optional values configuration
  dynamic "set" {
    for_each = var.additional_set_values
    content {
      name  = set.value.name
      value = set.value.value
      type  = try(set.value.type, null)
    }
  }

  # Optional values file
  values = var.values_file != null ? [file(var.values_file)] : []
}
