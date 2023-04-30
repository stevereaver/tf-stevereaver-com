# ----------------------------------------------------------------------------
# Google Managed Certs
# ----------------------------------------------------------------------------
resource "google_compute_managed_ssl_certificate" "stevereaver" {
  project = var.project_id
  name    = replace(var.domains_stevereaver[0], ".", "-")

  managed {
    domains = var.domains_stevereaver
  }
}

resource "google_compute_managed_ssl_certificate" "hugo" {
  project = var.project_id
  name    = replace(var.domains_hugo[0], ".", "-")

  managed {
    domains = var.domains_hugo
  }
}
