module "test_project" {
  source = "../"

  env             = var.env
  project_name    = var.project_name
  billing_account = var.billing_account
  gcp_credentials = var.gcp_credentials
  folder_stg  = var.folder_stg
  folder_prd  = var.folder_prd
  folder_dev  = var.folder_dev
}

variable "gcp_credentials" {
  type = string
}

variable "folder_dev" {
  type        = string
  description = "TFE value"
}

variable "folder_stg" {
  type        = string
  description = "TFE value"
}

variable "folder_prd" {
  type        = string
  description = "TFE value"
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

resource "random_string" "dummy" {
  length  = 3
  upper   = false
  lower   = true
  numeric = true
  special = false
}
