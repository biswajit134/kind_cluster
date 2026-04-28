
# Create a test cluster named "test" with a control-plane and
# two workers using the inline config argument
resource "kind_cluster" "kind-cluster" {
  name = "test"
  config = <<-EOF
        apiVersion: kind.x-k8s.io/v1alpha4
        kind: Cluster
        nodes:
        - role: control-plane
          image: kindest/node:v1.35.1
          kubeadmConfigPatches:
          - |
            kind: InitConfiguration
            nodeRegistration:
              kubeletExtraArgs:
                node-labels: "ingress-ready=true"
          extraPortMappings:
          - containerPort: 80
            hostPort: 80
            protocol: TCP
          - containerPort: 443
            hostPort: 443
            protocol: TCP

        - role: worker
          image: kindest/node:v1.35.1

        - role: worker
          image: kindest/node:v1.35.1

    EOF
}