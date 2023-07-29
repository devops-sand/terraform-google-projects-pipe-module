module "test_project" {
  source = "../"

  env             = var.env
  project_name    = var.project_name
  billing_account = var.billing_account
  // add these lines
  folder_stg      = var.folder_stg
  folder_prd      = var.folder_prd
  folder_dev      = var.folder_dev
  workspace       = var.workspace
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

variable "workspace" {
  type        = string
  description = "Parent folder name value from TFE"
}


terraform {
  backend "remote" {
    organization = "aethersen"
    workspaces {
      name = "test-workflow-then-delete"
    }
  }
}