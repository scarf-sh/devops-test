
variable "kind_cluster_name" {
    description = "Name of kind cluster"
    type        = string
    default     = "static"
}

variable "kind_cluster_node_image" {
    description = "Name of kind cluster"
    type        = string
    default     = "kindest/node:v1.24.0"
}

variable "container_port" {
    type    = number
}

variable "host_port" {
    type    = number
}