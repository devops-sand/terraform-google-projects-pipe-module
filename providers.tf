provider "google" {
  credentials = jsondecode(var.gcp_credentials)
}