resource "kubernetes_secret" "dockerhub" {
  metadata {
    name      = "dockerhub-regcred"
    namespace = kubernetes_namespace.apps.metadata[0].name
  }
  type = "kubernetes.io/dockerconfigjson"

  data = {
    ".dockerconfigjson" = base64encode(jsonencode({
      auths = {
        "https://index.docker.io/v1/" = {
          username = var.dockerhub_username
          password = var.dockerhub_password
          email    = var.dockerhub_email
          auth     = base64encode("${var.dockerhub_username}:${var.dockerhub_password}")
        }
      }
    }))
  }
}