
resource "digitalocean_kubernetes_cluster" "kubernetes_cluster" {
  name    = replace(var.domain,".","-")
  region  = lower(var.region)
  version = "1.31.1-do.5"

  node_pool {
    name       = "autoscale-worker-pool"
    size       = "s-2vcpu-2gb"
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }
}
