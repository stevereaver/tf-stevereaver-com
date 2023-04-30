resource "google_compute_url_map" "stevreaver-com-lb-url-map" {
  project     = var.project_id
  name        = "stevereaver-urlmap"
  description = "The URL map for public and mgmt sites"

  default_service = module.stevereaver_com_lb.backend_services.default.id

  host_rule {
    hosts        = var.domains_stevereaver
    path_matcher = "stevereaver-com"
    description  = "The rule to get to stevereaver.com"
  }

  host_rule {
    hosts        = var.domains_hugo
    path_matcher = "stevereaver-com"
    description  = "The rule to get to Hugo website"
  }

  path_matcher {
    name            = "stevereaver-com"
    default_service = module.stevereaver_com_lb.backend_services.default.id

    path_rule {
      paths   = ["/wp-admin"]
      service = module.stevereaver_com_lb.backend_services.admin.id
    }
    path_rule {
      paths   = ["/wp-login.php"]
      service = module.stevereaver_com_lb.backend_services.admin.id
    }
    path_rule {
      paths   = ["/phpmyadmin"]
      service = module.stevereaver_com_lb.backend_services.admin.id
    }
    path_rule {
      paths = [
        "/files",
        "/files/*"
      ]
      service = var.bucket_id
    }
  }
}