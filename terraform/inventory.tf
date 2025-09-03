# This file ensures the Ansible inventory has up-to-date IP addresses

output "ipa_ip" { value = linode_instance.ipa.ip_address }
output "app_ip" { value = linode_instance.apa.ip_address }

resource "local_file" "ansible_inventory" {
  filename = "${path.module}/../ansible/inventory.ini"
  content = templatefile("${path.module}/inventory.tmpl", {
    ipa_ip = linode_instance.ipa.ip_address
    app_ip = linode_instance.apa.ip_address
  })
}
