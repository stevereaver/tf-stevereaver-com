# ----------------------------------------------------------------------------
# Public Loadbalancer
# ----------------------------------------------------------------------------
module "stevereaver_com_lb" {
  source                          = "GoogleCloudPlatform/lb-http/google"
  version                         = "~> 6.1"
  name                            = "stevereaver-lb"
  project                         = var.project_id
  create_url_map                  = false
  url_map                         = google_compute_url_map.stevreaver-com-lb-url-map.self_link
  ssl                             = true
  random_certificate_suffix       = true
  https_redirect                  = true
  managed_ssl_certificate_domains = var.domains

  backends = {
    default = {
      description                     = "Default backend for webpages"
      protocol                        = "HTTP"
      port                            = 80
      port_name                       = "http"
      timeout_sec                     = 10
      connection_draining_timeout_sec = null
      enable_cdn                      = true
      security_policy                 = null
      session_affinity                = null
      affinity_cookie_ttl_sec         = null
      custom_request_headers          = null
      custom_response_headers         = null

      health_check = {
        check_interval_sec  = 5
        timeout_sec         = 5
        healthy_threshold   = 2
        unhealthy_threshold = 2
        request_path        = "/"
        port                = 80
        host                = null
        logging             = false
      }

      log_config = {
        enable      = false
        sample_rate = null
      }

      groups = [
        {
          group                        = google_compute_instance_group.instance_group.id
          balancing_mode               = null
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = 1
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = 0.8
        }
      ]
      iap_config = {
        enable               = false
        oauth2_client_id     = ""
        oauth2_client_secret = ""
      }
    },
    admin = {
      description                     = "Backend for wp-admin pages"
      protocol                        = "HTTP"
      port                            = 80
      port_name                       = "http"
      timeout_sec                     = 600
      connection_draining_timeout_sec = null
      enable_cdn                      = false
      security_policy                 = null
      session_affinity                = null
      affinity_cookie_ttl_sec         = null
      custom_request_headers          = null
      custom_response_headers         = null
      health_check = {
        check_interval_sec  = 120
        timeout_sec         = 120
        healthy_threshold   = 2
        unhealthy_threshold = 2
        request_path        = "/"
        port                = 80
        host                = null
        logging             = false
      }

      log_config = {
        enable      = true
        sample_rate = null
      }

      groups = [
        {
          group                        = google_compute_instance_group.instance_group.id
          balancing_mode               = "UTILIZATION"
          capacity_scaler              = null
          description                  = null
          max_connections              = null
          max_connections_per_instance = null
          max_connections_per_endpoint = null
          max_rate                     = 1
          max_rate_per_instance        = null
          max_rate_per_endpoint        = null
          max_utilization              = 0.8
        }
      ]
      iap_config = {
        enable               = true
        oauth2_client_id     = var.google-iap-client-id
        oauth2_client_secret = var.google-iap-client-secret
      }
    }
  }
}
