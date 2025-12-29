variable "zone_name" {
  type    = string
  default = "netarchitect.cloud"
}

variable "ovh_endpoint" {
  type    = string
  default = "ovh-eu"
}

# Get the zone information
data "ovh_domain_zone" "this" {
  name = var.zone_name
}

resource "ovh_domain_zone_record" "auth" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "auth"
  target    = "135.125.175.79"
  ttl       = 3600
}

resource "ovh_domain_zone_record" "grafana" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "grafana"
  target    = "135.125.175.79"
  ttl       = 3600
}

# Note: OVH provider does not have a "refresh" resource - changes are applied automatically
