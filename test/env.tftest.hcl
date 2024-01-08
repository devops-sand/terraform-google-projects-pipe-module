run "validate_env_variable" {
  variables {
    env              = "d"
    gcp_credentials  = "{\"type\": \"service_account\", \"project_id\": \"dummy-project\", \"private_key_id\": \"dummy-key-id\", \"private_key\": \"dummy-private-key\", \"client_email\": \"dummy-email\", \"client_id\": \"dummy-client-id\", \"auth_uri\": \"dummy-auth-uri\", \"token_uri\": \"dummy-token-uri\", \"auth_provider_x509_cert_url\": \"dummy-cert-url\", \"client_x509_cert_url\": \"dummy-cert-url\"}"
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
