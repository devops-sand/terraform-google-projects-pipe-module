
module "project" {
  source = "./modules"

  project_name    = "aether-${var.env}-${var.project_name}"
  project_id      = "aether-${var.env}-${var.project_name}-${random_string.rand.result}"
  billing_account = var.billing_account
  region          = var.region
  folder_id       = local.folder_id
  enable_apis     = local.api_defaults

}
