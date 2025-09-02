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

resource "linode_volume" "app_data" {
  label     = "app-data"
  region    = var.region
  size      = var.app_volume_size_gb
  linode_id = linode_instance.apa.id
}

output "app_volume_id_path" {
  value = "scsi-0Linode_Volume_${linode_volume.app_data.label}"
}