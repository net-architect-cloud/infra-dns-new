variable "zone_name" {
  type    = string
  default = "example-infomaniak.com"
}

# Get the domain information
data "infomaniak_domain_zone" "this" {
  domain_name = var.zone_name
}

# Example A record for root domain
resource "infomaniak_record" "apex" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "A"
  source      = "192.168.1.1"
  ttl         = 3600
}

# Example A record for subdomain
resource "infomaniak_record" "www" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "A"
  source      = "192.168.1.1"
  ttl         = 3600
}

# Example AAAA record for IPv6
resource "infomaniak_record" "ipv6" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "AAAA"
  source      = "2001:db8::1"
  ttl         = 3600
}

# Example CNAME record
resource "infomaniak_record" "api" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "CNAME"
  target      = "example.com."
  ttl         = 3600
}

# Example MX record
resource "infomaniak_record" "mx" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "MX"
  source      = "mail.example-infomaniak.com."
  priority    = 10
  ttl         = 3600
}

# Example TXT record for SPF
resource "infomaniak_record" "spf" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "TXT"
  source      = "v=spf1 -all"
  ttl         = 3600
}

# Example TXT record for DMARC
resource "infomaniak_record" "dmarc" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "TXT"
  source      = "v=DMARC1; p=none; rua=mailto:dmarc@example-infomaniak.com"
  ttl         = 3600
}

# Example SRV record using data field
resource "infomaniak_record" "srv" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "SRV"
  data = {
    priority = 10
    weight   = 5
    port     = 443
    target   = "target.example-infomaniak.com."
  }
  ttl         = 3600
}

# Example CAA record
resource "infomaniak_record" "caa" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "CAA"
  source      = "0 issue \"letsencrypt.org\""
  ttl         = 3600
}

# Example SSHFP record using data field
resource "infomaniak_record" "sshfp" {
  zone_fqdn = data.infomaniak_domain_zone.this.fqdn
  type        = "SSHFP"
  data = {
    fingerprint_type = 2  # SHA256
    fingerprint     = "your-ssh-fingerprint-here"
    fingerprint_algorithm = 2  # SHA256
  }
  ttl         = 3600
}
