variable "kind_cluster_name" {
    description = "Name of kind cluster"
    type        = string
    default     = "static"
}

variable "container_port" {
    type    = number
    default = 30950
}

variable "host_port" {
    type    = number
    default = 30950
}