
module "cluster" {
    source              = "../hello-world-terraform-module/kind-cluster"

    kind_cluster_name   = var.kind_cluster_name
    container_port      = 30950
    host_port           = 30950
}

locals {
    chart_path = format("%s/%s", abspath("${path.module}/.."), "hello-world-helm-chart") 
}

module "hello-world" {
    source = "../hello-world-terraform-module/helm"

    chart_path = local.chart_path
    dependencies = [ module.cluster ]
}