variable "zone_name" {
  type    = string
  default = "example-infomaniak.com"
}

# Get the domain information
data "infomaniak_domain" "this" {
  domain_name = var.zone_name
}

# Example A record for root domain
resource "infomaniak_domain_record" "apex" {
  domain_id = data.infomaniak_domain.this.id
  type      = "A"
  name      = "@"
  value     = "192.168.1.1"  # Replace with your IP
  ttl       = 3600
}

# Example A record for subdomain
resource "infomaniak_domain_record" "www" {
  domain_id = data.infomaniak_domain.this.id
  type      = "A"
  name      = "www"
  value     = "192.168.1.1"  # Replace with your IP
  ttl       = 3600
}

# Example AAAA record for IPv6
resource "infomaniak_domain_record" "ipv6" {
  domain_id = data.infomaniak_domain.this.id
  type      = "AAAA"
  name      = "ipv6"
  value     = "2001:db8::1"  # Replace with your IPv6 address
  ttl       = 3600
}

# Example CNAME record
resource "infomaniak_domain_record" "api" {
  domain_id = data.infomaniak_domain.this.id
  type      = "CNAME"
  name      = "api"
  value     = "api.example.com."  # Replace with your target
  ttl       = 3600
}

# Example MX record
resource "infomaniak_domain_record" "mx" {
  domain_id = data.infomaniak_domain.this.id
  type      = "MX"
  name      = "@"
  value     = "mail.example-infomaniak.com."  # Replace with your mail server
  priority  = 10
  ttl       = 3600
}

# Example TXT record for SPF
resource "infomaniak_domain_record" "spf" {
  domain_id = data.infomaniak_domain.this.id
  type      = "TXT"
  name      = "@"
  value     = "v=spf1 -all"  # Replace with your SPF policy
  ttl       = 3600
}

# Example TXT record for DMARC
resource "infomaniak_domain_record" "dmarc" {
  domain_id = data.infomaniak_domain.this.id
  type      = "TXT"
  name      = "_dmarc"
  value     = "v=DMARC1; p=none; rua=mailto:dmarc@example-infomaniak.com"  # Replace with your DMARC policy
  ttl       = 3600
}

# Example SRV record
resource "infomaniak_domain_record" "srv" {
  domain_id = data.infomaniak_domain.this.id
  type      = "SRV"
  name      = "_service._tcp"
  value     = "10 5 443 target.example-infomaniak.com."  # priority weight port target
  ttl       = 3600
}

# Example CAA record
resource "infomaniak_domain_record" "caa" {
  domain_id = data.infomaniak_domain.this.id
  type      = "CAA"
  name      = "@"
  value     = "0 issue \"letsencrypt.org\""  # Allow Let's Encrypt certificates
  ttl       = 3600
}
