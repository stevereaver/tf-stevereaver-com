# ----------------------------------------------------------------------------
# Project Constants
# ----------------------------------------------------------------------------
variable "project_id" {
  type = string
}
variable "region" {
  type = string
}
variable "location" {
  type = string
}
variable "instance" {
  type = string
}
variable "zone" {
  type = string
}
variable "instance_group" {
  type = string
}
variable "domains" {
  type = list(string)
}
variable "iap_users" {
  type = list(string)
}
variable "network" {
  type = string
}
variable "min_ports_per_vm" {
  type = string
}
variable "max_ports_per_vm" {
  type = string
}

# ----------------------------------------------------------------------------
# APIs need for project
# ----------------------------------------------------------------------------
variable "gcp_service_list" {
  description = "List of GCP APIs that are required by project"
  type        = list(string)
  default = [
    "cloudresourcemanager.googleapis.com",
    "iam.googleapis.com",
    "logging.googleapis.com",
    "iap.googleapis.com",
  ]
}