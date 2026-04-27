resource "helm_release" "argocd" {
  name = "argocd"
  repository = "https://argoproj.github.io/argo-helm"
  chart = "argo-cd"
  version = "9.5.2"
  namespace = "argocd"
  create_namespace = true
  force_update  = true
  cleanup_on_fail = true

  set =[{
    name  = "server.service.type"
    value = "LoadBalancer"
  },

  {
    name  = "configs.secret.argocdServerAdminPassword"
    value = bcrypt("${var.ARGOCD_PASSWORD}", 10)  # Change this!
  }]
}
