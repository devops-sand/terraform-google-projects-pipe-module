run "validate_env_variable" {
  variables {
    env = "k"
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "The 'env' variable must be either 'd', 's', or 'p'."
  }
}
