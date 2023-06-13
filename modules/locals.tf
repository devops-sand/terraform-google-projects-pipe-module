locals {
  services         = toset(var.enable_apis)
  exempted_projects = []
}
