run "validate_env_variable" {
  variables {
    env             = "invalid" # Intentionally invalid value to test the validation
    gcp_credentials = var.gcp_credentials
    folder_stg      = var.folder_stg
    folder_prd      = var.folder_prd
    folder_dev      = var.folder_dev
    project_name    = var.project_name
    billing_account = var.billing_account
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "The 'env' variable must be either 'd', 's', or 'p'."
  }
}
