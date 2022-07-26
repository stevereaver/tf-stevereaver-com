output "google-iap-client-id" {
  value = data.google_secret_manager_secret_version.oauth2_client_id.secret_data
}
output "google-iap-client-secret" {
  value = data.google_secret_manager_secret_version.oauth2_client_secret.secret_data
}