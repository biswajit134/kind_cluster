resource "helm_release" "ingress_nginx" {
  name = "ingress-nginx"
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart = "ingress-nginx"
  version = "4.15.1"
  namespace = "ingress-nginx"
  create_namespace = true
  wait = true
  wait_for_jobs = true
  cleanup_on_fail = true

  set =[{
    name  = "controller.replicaCount"
    value = "2"
  },

  {
    name  = "controller.service.type"
    value = "LoadBalancer"
  }]
}