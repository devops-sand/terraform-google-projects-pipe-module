module "test_project" {
  source = "../"

  env             = var.env
  project_name    = var.project_name
  billing_account = var.billing_account
  folder_dev = var.folder_dev
  folder_stg = var.folder_stg
  folder_prd = var.folder_prd
  workspace = var.workspace

}


variable "org" {
  type = string
}

variable "project_name" {
  type    = string
  default = "test"
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