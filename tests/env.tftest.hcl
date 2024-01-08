run "validate_env_variable" {
  variables {
    env = "e" 
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "Provided 'env' value is not 'd', 's', or 'p'."
  }
}
