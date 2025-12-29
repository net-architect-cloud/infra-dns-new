module "netarchitect.cloud" {
  source = "./zones/netarchitect.cloud"

  providers = {
    ovh = ovh
  }
}