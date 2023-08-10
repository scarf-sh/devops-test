terraform {
  required_providers {
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = "1.14.0"
    }
    kind = {
      source  = "tehcyx/kind"
      version = "0.2.0"
    }
  }
  required_version = ">= 0.14"
}