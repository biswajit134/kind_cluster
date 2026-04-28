resource "helm_release" "metallb" {
    name       = "metallb"
    repository = "https://metallb.github.io/metallb"
    chart      = "metallb"
    version    = "0.15.3"
    namespace  = "metallb-system"
    create_namespace = true
    wait = true
    wait_for_jobs = true
    cleanup_on_fail = true
}

resource "kubectl_manifest" "IPAddressPool-crd" {
    depends_on = [ helm_release.metallb ]
    yaml_body = templatefile("${path.module}/IPAddressPool-crd.yml", {})
#  manifest = yamldecode(templatefile("${path.module}/IPAddressPool-crd.yml", {}))
}

resource "kubectl_manifest" "L2Advertisement-crd" {
    depends_on = [ kubectl_manifest.IPAddressPool-crd ]
    yaml_body = templatefile("${path.module}/L2Advertisement-crd.yml", {})
#  manifest = yamldecode(templatefile("${path.module}/L2Advertisement-crd.yml", {}))
}