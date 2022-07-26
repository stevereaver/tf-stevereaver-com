data "google_secret_manager_secret_version" "oauth2_client_id" {
  project = var.project_id
  secret  = "oauth2_client_id"
}
data "google_secret_manager_secret_version" "oauth2_client_secret" {
  project = var.project_id
  secret  = "oauth2_client_secret"
}