# Install Argo CD via Helm and expose server as LoadBalancer
resource "helm_release" "argocd" {
  name             = "argocd"
  repository       = "https://argoproj.github.io/argo-helm"
  chart            = "argo-cd"
  namespace        = "argocd"
  create_namespace = true

  # Optionally pin a chart version, e.g.:
  # version = "7.6.1"

  values = [
    <<-YAML
    server:
      service:
        type: LoadBalancer
    dex:
      enabled: false
    YAML
  ]
}

# Apply Argo CD Applications so Argo watches gitops/ paths
resource "kubernetes_manifest" "argocd_apps" {
  manifest = yamldecode(templatefile("${path.module}/templates/argocd-apps.tmpl.yaml", {
    repo_url = var.git_repository_url
  }))

  depends_on = [helm_release.argocd, kubernetes_namespace.apps]
}