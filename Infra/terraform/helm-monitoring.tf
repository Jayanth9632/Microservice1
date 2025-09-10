# kube-prometheus-stack (Prometheus + Grafana)
resource "helm_release" "kps" {
  name             = "kube-prometheus-stack"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true

  values = [
    <<-YAML
    grafana:
      adminPassword: ${var.grafana_admin_password}
      service:
        type: LoadBalancer
    prometheus:
      service:
        type: LoadBalancer
    YAML
  ]

  depends_on = [module.eks]
}
