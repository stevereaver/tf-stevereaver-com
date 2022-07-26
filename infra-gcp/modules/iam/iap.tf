# The support email address can ONLY be set as the caller of the API 
# which is cloudbuild in our case (stupid!)
# Also, it must be changed to EXTERNAL in the console once it is created
# To allow the external users to get access to IAP (beyond dumb!)

/*
resource "google_iap_brand" "project_brand" {
  support_email     = "${var.project_number}@cloudbuild.gserviceaccount.com"
  application_title = "stevereaver-com"
  project           = var.project_id
}

# Get the list of brands with;  gcloud alpha iap oauth-brands list
# There can only be one per project
resource "google_iap_client" "project_client" {
  display_name = "IAP-stevereaver"
  brand        = "projects/${var.project_number}/brands/${var.project_number}"
}

*/

resource "google_iap_web_iam_binding" "binding" {
  project = var.project_id
  role    = "roles/iap.httpsResourceAccessor"
  members = var.iap_users
}