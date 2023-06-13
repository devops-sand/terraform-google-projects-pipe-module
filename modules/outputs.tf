output "project_id" {
  description = "The ID of the project"
  value       = google_project.project.project_id
}

output "project_number" {
  description = "The number of the project"
  value       = google_project.project.number
}
