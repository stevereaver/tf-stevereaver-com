# ----------------------------------------------------------------------------
# Instance Group
# ----------------------------------------------------------------------------
resource "google_compute_instance_group" "instance_group" {
  project   = var.project_id
  name      = var.instance_group
  zone      = var.zone
  instances = [var.instance]
  named_port {
    name = "http"
    port = "80"
  }
}
