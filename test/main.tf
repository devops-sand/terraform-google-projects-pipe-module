module "test_project" {
  source = "../"

  env             = var.env
  project_name    = var.project_name
  billing_account = var.billing_account

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
