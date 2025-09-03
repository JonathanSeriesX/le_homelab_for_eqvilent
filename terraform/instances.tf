resource "linode_instance" "ipa" {
  label           = "ipa"
  region          = var.region
  type            = var.ipa_type
  image           = "linode/rocky9" # Rocky Linux is perfect for FreeIPA
  root_pass       = var.root_pass
  authorized_keys = [var.ssh_pub_key]
  private_ip      = true
  tags            = ["ipa-app"]
}

resource "linode_instance" "apa" {
  label           = "app"
  region          = var.region
  type            = var.app_type
  image           = "linode/ubuntu24.10" # upgrade to 25.04 asap because of https://bugs.launchpad.net/ubuntu/+source/freeipa/+bug/2078034
  root_pass       = var.root_pass
  authorized_keys = [var.ssh_pub_key]
  private_ip      = true
  tags            = ["ipa-app"]
}
