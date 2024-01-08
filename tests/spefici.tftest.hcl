run "env" {
  command = apply

  variables {
    env = "${run.tests.env}"
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "Provided 'env' value is not 'd', 's', or 'p'."
  }

}