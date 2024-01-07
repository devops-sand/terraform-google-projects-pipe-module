run "validate_env_variable" {
  variables {
    env              = "d"
    gcp_credentials  = "dummy_credentials"
    folder_dev       = "dummy_folder_dev"
    folder_stg       = "dummy_folder_stg"
    folder_prd       = "dummy_folder_prd"
    billing_account  = "dummy_billing_account"
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "The 'env' variable must be either 'd', 's', or 'p'."
  }
}
