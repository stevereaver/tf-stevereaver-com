#module "projects_iam_bindings" {
#  source  = "terraform-google-modules/iam/google//modules/projects_iam"
#  version = "~> 6.4"
#
#  projects = [var.project_id]
#  mode     = "authoritative"
#
#  bindings = {
#    "roles/run.admin" = [
#      "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
#    ]
#    "roles/cloudbuild.builds.builder" = [
#      "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
#    ]
#    "roles/iam.serviceAccountUser" = [
#      "serviceAccount:${var.project_number}@cloudbuild.gserviceaccount.com",
#    ]
#    "roles/owner" = [
#      "user:stevereaver@gmail.com"
#    ]
#  }
#}

module "custom-roles-compute" {
  source       = "terraform-google-modules/iam/google//modules/custom_role_iam"
  target_level = "project"
  target_id    = var.project_id
  role_id      = "compute.power"
  title        = "Compute Power"
  description  = "Stop and Start Compute"
  permissions  = ["compute.instances.start", "compute.instances.stop"]
  members      = ["serviceAccount:service-${var.project_number}@compute-system.iam.gserviceaccount.com"]
}

resource "google_service_account" "hugo_deployer" {
  account_id   = "hugo-deployer"
  display_name = "Hugo Deployer"
  project      = var.project_id
}

resource "google_project_iam_member" "hugo_deployer_cdn_invalidation" {
  project = var.project_id
  role    = "roles/compute.loadBalancerAdmin"
  member  = "serviceAccount:${google_service_account.hugo_deployer.email}"
}
