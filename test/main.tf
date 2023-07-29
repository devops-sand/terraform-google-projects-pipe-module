module "test_project" {
  source = "../"

  env             = var.env
  project_name    = var.project_name
  billing_account = var.billing_account
  gcp_credentials = var.gcp_credentials
}

variable "gcp_credentials" {
  type = string
}



variable "project_name" {
  type    = string
  default = "module-test"
}

variable "env" {
  type    = string
  default = "d"
}

variable "billing_account" {
  type        = string
  description = "Billing account declared in TFE"
}

