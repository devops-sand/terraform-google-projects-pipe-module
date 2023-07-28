resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account

  folder_id = var.folder_id
}

resource "google_project_service" "project_service" {
  for_each                   = local.services
  project                    = google_project.project.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false
}

locals {
  services          = toset(var.enable_apis)
  exempted_projects = []
}


output "project_id" {
  description = "The ID of the project"
  value       = google_project.project.project_id
}

output "project_number" {
  description = "The number of the project"
  value       = google_project.project.number
}


variable "folder_id" {
  type        = string
  description = "Folder ID"
  default     = ""
}

variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "region" {
  description = "The region where the project will be created"
  type        = string
}

variable "enable_apis" {
  description = "Apis to enable"
  type        = list(string)
  default     = ["compute.googleapis.com", "monitoring.googleapis.com"]
}
