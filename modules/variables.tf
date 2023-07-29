variable "folder_id" {
  type        = string
  description = "Folder ID"
}

variable "project_id" {
  description = "The ID of the project"
  type        = string
}

variable "project_name" {
  description = "The name of the project"
  type        = string
}

variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}

variable "region" {
  description = "The region where the project will be created"
  type        = string
}

variable "enable_apis" {
  description = "Apis to enable"
  type        = list(string)
  default     = ["compute.googleapis.com", ]
}
