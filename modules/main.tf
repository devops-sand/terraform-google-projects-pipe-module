resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account
  folder_id       = var.folder_id
  enable_apis     = var.enable_apis
}

resource "google_project_service" "project_service" {
  for_each                   = local.services
  project                    = google_project.project.project_id
  service                    = each.value
  disable_dependent_services = true
  disable_on_destroy         = false
}