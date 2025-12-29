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


resource "ovh_domain_zone_record" "ns_1" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "NS"
  subdomain = "@"
  target    = "dns110.ovh.net."
  ttl       = 0
}
resource "ovh_domain_zone_record" "ns_2" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "NS"
  subdomain = "@"
  target    = "ns110.ovh.net."
  ttl       = 0
}
resource "ovh_domain_zone_record" "auth" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "auth"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "emqx" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "emqx"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "infra" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "infra"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "grafana" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "grafana"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "pangolin" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "pangolin"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "pgadmin" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "pgadmin"
  target    = "135.125.175.79"
  ttl       = 0
}
resource "ovh_domain_zone_record" "status" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "status"
  target    = "109.234.167.44"
  ttl       = 0
}

# Note: OVH provider does not have a "refresh" resource - changes are applied automatically
