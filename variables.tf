variable "gcp_credentials" {
  type = string
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
}

variable "folder_stg" {
  type        = string
  description = "TFE value"
}

variable "folder_prd" {
  type        = string
  description = "TFE value"
}

variable "enable_apis" {
  description = "Apis to enable"
  type        = list(string)
  default     = ["compute.googleapis.com", ]
}