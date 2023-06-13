resource "google_project" "project" {
  name            = var.project_name
  project_id      = var.project_id
  billing_account = var.billing_account

  lifecycle {
    precondition {
      condition     = contains(["dev", "stg", "prd"], var.env) || contains(local.exempted_projects, var.project_id)
      error_message = "For projects other than those in 'exempted_projects', the 'env' variable must be either 'dev', 'stg', or 'prd'."
    }
  }
}

resource "google_project_service" "project_service" {
  for_each = local.services
  project = google_project.project.project_id
  service = each.value
  disable_dependent_services = true
  disable_on_destroy = false 
}

