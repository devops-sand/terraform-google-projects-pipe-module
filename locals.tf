locals {
  folder_ids = {
    "d" = var.folder_dev
    "s" = var.folder_stg
    "p" = var.folder_prd
  }
  folder_id      = local.folder_ids[var.env]
  api_defaults   = concat(var.enable_apis, local.mandatory_apis)
  mandatory_apis = ["monitoring.googleapis.com", "cloudbilling.googleapis.com", "cloudresourcemanager.googleapis.com"]
}
