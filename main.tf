
module "project" {
  source = "./modules"

  project_name    = "${var.env}-${var.project_name}"
  project_id      = "${var.env}-${var.project_name}-${random_string.rand.result}"
  billing_account = var.billing_account
  region          = var.region
  org             = var.org
  folder_id       = local.folder_id

}
resource "random_string" "rand" {
  length  = 3
  upper   = false
  lower   = true
  number  = true
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
  type    = string
  default = ""
}

variable "org" {
  type = string
  default = ""
}

variable "env" {
  type = string
  validation {
    condition     = contains(["d", "s", "p"], var.env)
    error_message = "The 'env' variable must be either 'd', 's', or 'p'."
  }

}


variable "project_name" {
  type = string
  validation {
    condition     = length(var.project_name) > 3 && length(var.project_name) < 12 && can(regex("^[a-z0-9]*$", var.project_name))
    error_message = "Project name should consist only from lowercase letters or numbers and be between 3 and 12 signs."
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