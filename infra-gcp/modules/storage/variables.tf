variable "project_id" {
  type        = string
  description = "The project ID to deploy resource into"
}

variable "hugo_deployer_email" {
  description = "Email of the service account used to deploy Hugo"
  type        = string
}
