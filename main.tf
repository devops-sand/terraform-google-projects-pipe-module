
module "project" {
  source = "./modules"

  project_name    = "aether-${var.env}-${var.project_name}"
  project_id      = "aether-${var.env}-${var.project_name}-${random_string.rand.result}"
  billing_account = var.billing_account
  region          = var.region
  folder_id       = local.folder_id

}
resource "random_string" "rand" {
  length  = 3
  upper   = false
  lower   = true
  numeric = true
  special = false
}


locals {
  folder_ids = {
    "d" = var.folder_dev
    "s" = var.folder_stg
    "p" = var.folder_prd
  }
  folder_id = local.folder_ids[var.env]
}


variable "gcp_credentials" {
  type = string
}


variable "env" {
  type = string
  validation {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "The 'env' variable must be either 'd', 's', or 'p'."
  }
  default = ""
}


variable "project_name" {
  type = string
  validation {
    condition     = length(var.project_name) > 3 && length(var.project_name) < 12 && can(regex("^[a-z0-9][-a-z0-9]*[a-z0-9]$", var.project_name))
    error_message = "Project name should consist only of lowercase letters, numbers, or dashes and be between 3 and 12 characters. Dashes cannot be at the beginning or end of the project name."
  }
}


variable "region" {
  type    = string
  default = "uscental1"
}

variable "billing_account" {
  type        = string
  description = "Billing account declared in TFE"
}

variable "folder_dev" {
  type        = string
  description = "TFE value"
  default     = ""
}

variable "folder_stg" {
  type        = string
  description = "TFE value"
  default     = ""
}

variable "folder_prd" {
  type        = string
  description = "TFE value"
  default     = ""
}

terraform {
  required_version = ">= 1.5.0"
}