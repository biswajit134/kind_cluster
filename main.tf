module kind_cluster {
  source = "./modules/kind-cluster"
}

module "helm_metallb" {
    depends_on = [ module.kind_cluster ]
  source = "./modules/helm_addons/metallb"
}
module "helm_ingress_nginx" {
    depends_on = [ module.helm_metallb ]
  source = "./modules/helm_addons/ingress-nginx"
}

module "helm_argocd" {
    depends_on = [ module.helm_metallb, module.helm_ingress_nginx ]
  source = "./modules/helm_addons/argocd"
  ARGOCD_PASSWORD = "biswajit123"
}

module "argocd_app" {
    depends_on = [ module.helm_argocd ]
  source = "./modules/argocd_app"
}