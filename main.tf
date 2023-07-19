provider "google" {
  version = "2.14.0"
}
provider "google-beta" {
  version = "2.14.0"
}
provider "null" {
  version = "2.1.2"
}
provider "random" {
  version = "2.2.1"
}

resource "null_resource" "n" {
  triggers = {
    uuid = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "ls -alR"
  }
}

module "project-factory" {
  source  = "terraform-google-modules/project-factory/google"
  version = "2.4.1"

  billing_account     = "ABCDEF-ABCDEF-ABCDEF"
  name                = "pf-test-1"
  org_id              = "1234567890"
}
