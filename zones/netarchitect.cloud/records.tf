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
  target    = "dns110.ovh.net.."
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

resource "ovh_domain_zone_record" "grafana" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "A"
  subdomain = "grafana"
  target    = "135.125.175.79"
  ttl       = 0
}

# NS record for subdomain delegation
resource "ovh_domain_zone_record" "subdomain_ns" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "NS"
  subdomain = "subdomain"
  target    = "ns1.ovh.net."
  ttl       = 3600
}

# NS record for multiple nameservers
resource "ovh_domain_zone_record" "subdomain_ns2" {
  zone      = data.ovh_domain_zone.this.name
  fieldtype = "NS"
  subdomain = "subdomain"
  target    = "ns2.ovh.net."
  ttl       = 3600
}

# Note: OVH provider does not have a "refresh" resource - changes are applied automatically
