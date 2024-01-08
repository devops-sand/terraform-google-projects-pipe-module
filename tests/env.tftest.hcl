run "create_google_project" {
  command = apply

  variables {
    env              = "d"
    project_name     = "test-project"
    billing_account  = "000000-000000-000000"
    region           = "us-central1"
    folder_dev       = "folder-dev-id"
    folder_stg       = "folder-stg-id"
    folder_prd       = "folder-prd-id"
    enable_apis      = ["compute.googleapis.com", "monitoring.googleapis.com"]
    gcp_credentials  = "{\"type\": \"service_account\", ...}"  # Mock credentials in expected JSON format
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "Provided 'env' value does not meet the expected criteria."
  }
}
