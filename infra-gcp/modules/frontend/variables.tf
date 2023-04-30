variable "project_id" {
  type        = string
  description = "The project ID to deploy resource into"
}

variable "region" {
  type        = string
  description = "The region where all resources will be deployed"
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
variable "domains_stevereaver" {
  type = list(string)
}
variable "domains_hugo" {
  type = list(string)
}
variable "bucket_id" {
  type = string
}
variable "google-iap-client-id" {
  type = string
}
variable "google-iap-client-secret" {
  type = string
}