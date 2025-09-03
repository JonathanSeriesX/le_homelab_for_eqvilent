resource "linode_instance" "ipa" {
  label           = "ipa"
  region          = var.region
  type            = var.ipa_type
  image           = "linode/rocky9"
  root_pass       = var.root_pass
  authorized_keys = [var.ssh_pub_key]
  private_ip      = true
  tags            = ["ipa-app"]
}

resource "linode_instance" "apa" {
  label           = "app"
  region          = var.region
  type            = var.app_type
  image           = "linode/ubuntu24.10"
  root_pass       = var.root_pass
  authorized_keys = [var.ssh_pub_key]
  private_ip      = true
  tags            = ["ipa-app"]
}
