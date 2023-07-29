locals {
  folder_id = var.env == "d" ? var.folder_dev : var.env == "s" ? var.folder_stg : var.folder_prd 
  api_defaults   = concat(var.enable_apis, local.mandatory_apis)
  mandatory_apis = ["monitoring.googleapis.com", "cloudbilling.googleapis.com", "cloudresourcemanager.googleapis.com"]
}
