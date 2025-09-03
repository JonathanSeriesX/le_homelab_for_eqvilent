# Eqvilent Test Task for Infrastructure Support Engineer

Current status:

- Server provisioning on Linode is automated with Terraform.
- Ansible playbooks perform the following:
  - Installs FreeIPA server.
  - Installs Docker and configures LVM on the app server.
  - Sets up the FreeIPA client on the app server and applies permissions.

Known issues:

- The app server must run Ubuntu 25.04, otherwise you'll encounter this [bug](https://bugs.launchpad.net/ubuntu/+source/freeipa/+bug/2078034). Since Linode does not yet provide the latest Ubuntu image, you must first run 'ansible/ubuntu_upgrade.yml' to perform a manual do-release-upgrade before installing 'freeipa-client'.

What could be done next?

- Automate DNS record creation with the Cloudflare API.
- Use user groups instead of assigning permissions to individual users.
