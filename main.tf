module "netarchitect_cloud" {
  source = "./zones/netarchitect.cloud"

  providers = {
    ovh = ovh
  }
}