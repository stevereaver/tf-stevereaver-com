#resource "google_storage_bucket_access_control" "public_rule" {
#  bucket = google_storage_bucket.files.name
#  role   = "READER"
#  entity = "allUsers"
#}

resource "google_storage_bucket" "files" {
  project                     = var.project_id
  name                        = "${var.project_id}-files"
  location                    = "US"
  uniform_bucket_level_access = false
}

resource "google_storage_bucket_iam_member" "member" {
  bucket = google_storage_bucket.files.name
  role   = "roles/storage.objectViewer"
  member = "allUsers"
}

resource "google_compute_backend_bucket" "files" {
  project     = var.project_id
  name        = "stevereaver-com-files"
  description = "Public file storage"
  bucket_name = google_storage_bucket.files.name
  enable_cdn  = true
}

#------------------------------------------------------
# Bucket for Hugo website

resource "google_storage_bucket" "hugo" {
  project                     = var.project_id
  name                        = "${var.project_id}-hugo-files"
  location                    = "US"
  uniform_bucket_level_access = true
}

resource "google_compute_backend_bucket" "hugo_files" {
  project     = var.project_id
  name        = "hugo-files"
  description = "Contains HUGo website files"
  bucket_name = google_storage_bucket.hugo.name
  enable_cdn  = true
}