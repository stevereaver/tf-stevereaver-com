output "hugo_deployer_email" {
  value       = google_service_account.hugo_deployer.email
  description = "The email of the Hugo deployer service account"
}
