run "tests" {
    module {
        source = "../"
    }
}

run "env" {
  command = apply

  variables {
    env = "${run.tests.env}"
    gcp_credentials = "${run.tests.gcp_credentials}"
    project_name = "${run.tests.project_name}"
    billing_account = "${run.tests.billing_account}"
    folder_dev = "${run.tests.folder_dev}"
    folder_stg = "${run.tests.folder_stg}"
    folder_prd = "${run.tests.folder_prd}"
  }

  assert {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "Provided 'env' value is not 'd', 's', or 'p'."
  }

}