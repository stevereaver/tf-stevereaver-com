# ----------------------------------------------------------------------------
# APIs to enable
# ----------------------------------------------------------------------------
resource "google_project_service" "gcp_services" {
  count                      = length(var.gcp_service_list)
  project                    = var.project_id
  service                    = var.gcp_service_list[count.index]
  disable_dependent_services = false
  disable_on_destroy         = false
}

#-------------------------------------------------------
# IAM
#-------------------------------------------------------
module "iam" {
  source         = "./modules/iam"
  project_id     = var.project_id
  region         = var.region
  project_number = data.google_project.project.number
  iap_users      = var.iap_users
  depends_on     = [google_project_service.gcp_services]
}

#-------------------------------------------------------
# Frontend Module
#-------------------------------------------------------
module "frontend" {
  source                   = "./modules/frontend"
  project_id               = var.project_id
  region                   = var.region
  zone                     = var.zone
  domains_stevereaver      = var.domains_stevereaver
  domains_hugo             = var.domains_hugo
  instance_group           = var.instance_group
  instance                 = var.instance
  google-iap-client-id     = module.secrets.google-iap-client-id
  google-iap-client-secret = module.secrets.google-iap-client-secret
  bucket_id                = module.storage.files_bucket_id
}

#-------------------------------------------------------
# Storage Module
#-------------------------------------------------------
module "storage" {
  source     = "./modules/storage"
  project_id = var.project_id
}

#-------------------------------------------------------
# Secrets Module
#-------------------------------------------------------
module "secrets" {
  source     = "./modules/secrets"
  project_id = var.project_id
}

#-------------------------------------------------------
# CLOUD NAT
#-------------------------------------------------------
module "cloudnat" {
  source           = "./modules/cloudnat"
  project_id       = var.project_id
  region           = var.region
  network          = var.network
  min_ports_per_vm = var.min_ports_per_vm
  max_ports_per_vm = var.max_ports_per_vm
  depends_on       = [google_project_service.gcp_services]
}

#-------------------------------------------------------
# Compute
#-------------------------------------------------------
module "compute" {
  source     = "./modules/compute"
  project_id = var.project_id
  region     = var.region
  zone       = var.zone
}

# ----------------------------------------------------------------------------
# Project Data
# ----------------------------------------------------------------------------
data "google_project" "project" {
  project_id = var.project_id
}