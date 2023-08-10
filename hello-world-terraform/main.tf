
module "cluster" {
    source              = "../kind-tf-module/kind-cluster"

    kind_cluster_name   = var.kind_cluster_name
    container_port      = 30950
    host_port           = 30950
}
