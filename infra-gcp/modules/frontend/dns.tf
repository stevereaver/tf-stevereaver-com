# ----------------------------------------------------------------------------
# stevereaver.com
# ----------------------------------------------------------------------------
resource "google_dns_managed_zone" "stevereaver" {
  project     = var.project_id
  name        = "stevereaver-com"
  dns_name    = "stevereaver.com."
  description = "stevereaver.com"
  visibility  = "public"
}
resource "google_dns_record_set" "stevereaver" {
  project = var.project_id
  name = google_dns_managed_zone.stevereaver.dns_name
  type = "A"
  ttl  = 300
  managed_zone = google_dns_managed_zone.stevereaver.name
  rrdatas = [module.stevereaver_com_lb.external_ip]
}

resource "google_dns_record_set" "stevereaver-cname" {
  project = var.project_id
  name         = "www.stevereaver.com."
  managed_zone = google_dns_managed_zone.stevereaver.name
  type         = "CNAME"
  ttl          = 300
  rrdatas      = [google_dns_managed_zone.stevereaver.dns_name]
}



# ----------------------------------------------------------------------------
# stephenbancroft.id.au
# ----------------------------------------------------------------------------
resource "google_dns_managed_zone" "stephenbancroft" {
  project     = var.project_id
  name        = "stephenbancroft-id-au"
  dns_name    = "stephenbancroft.id.au."
  description = "stephenbancroft.id.au"
  visibility  = "public"
}
resource "google_dns_record_set" "stephenbancroft" {
  project = var.project_id
  name = google_dns_managed_zone.stephenbancroft.dns_name
  type = "A"
  ttl  = 300
  managed_zone = google_dns_managed_zone.stephenbancroft.name
  rrdatas = [module.stevereaver_com_lb.external_ip]
}