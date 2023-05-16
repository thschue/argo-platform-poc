module "whizus_sks_cluster" {
  source              = "../../../whizus/terraform-module-sks-platform-whizus"
  cluster_name        = "thschue-demo"
  exoscale_api_key    = var.exo_api_key
  exoscale_api_secret = var.exo_api_secret
  sks_version         = "1.26.4"
  mimir_enabled       = "false"
  argo_enabled        = "true"
  argo_envs = [
    {
      repoUrl = "https://github.com/thschue/argo-platform-poc"
      path    = "gitops/bootstrap"
      name    = "bootstrap"
    }
  ]
  zone = "AT-VIE-1"
  node_pools = {
    "default" = {
      instance_type = "standard.medium"
      size          = 1
      disk_size     = 40
      enabled       = true
    }
  }
  onepassword_enabled = "false"
  onepassword_connect_credentials = ""
  onepassword_token = ""
  onepassword_items = []
}
