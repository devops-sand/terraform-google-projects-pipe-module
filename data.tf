resource "null_resource" "test" {
  triggers = {
    value = "Test workflow!"
  }
}


terraform {
  backend "remote" {
    organization = "aether-default"
    workspaces {
      name = "tarot-dev"
    }
  }
}