resource "helm_release" "hello_world_helm_chart" {

    name = var.chart_name

    chart      = var.chart_path
    repository = var.chart_repository
    namespace  = "default"

    depends_on = [ 
        var.dependencies
    ]
}