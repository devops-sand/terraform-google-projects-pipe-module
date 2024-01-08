run "create_bucket" {
  command = apply

  variables {
    env = "d"
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "Provided 'env' value is not 'd', 's', or 'p'."
  }

}