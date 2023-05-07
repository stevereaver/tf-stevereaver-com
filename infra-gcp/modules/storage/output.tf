output "files_bucket_id" {
  value = google_compute_backend_bucket.files.id
}
output "hugo_bucket_id" {
  value = google_compute_backend_bucket.hugo_files.id
}