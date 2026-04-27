resource "kubernetes_namespace_v1" "sms_app" {
    metadata {
        name = "sms-app"
    }   
  
}

resource "kubectl_manifest" "sms_backend" {
    depends_on = [ kubernetes_namespace_v1.sms_app ]
    wait = true
    yaml_body = templatefile("${path.module}/sms-backend.yaml", {})
}

resource "kubectl_manifest" "sms_frontend" {
    depends_on = [ kubectl_manifest.sms_backend ]
    wait = true
    yaml_body = templatefile("${path.module}/sms-frontend.yaml", {})
}