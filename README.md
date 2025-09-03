# Eqvilent Test Task for Infrastructure Support Engineer

## Current status

- Server provisioning on [Linode](https://www.linode.com) is automated with Terraform.
- Ansible playbooks perform the following:
  - Installs the FreeIPA server.
  - Installs Docker and configures LVM on the application server.
  - Sets up the FreeIPA client on the application server and applies the required permissions.

## How it's done

I chose idempotent automation with [Terraform](https://developer.hashicorp.com/terraform) and [Ansible](https://www.redhat.com/en/ansible-collaborative), as this is the cleanest and most reliable approach. It also minimises the need for extensive documentation, since the configuration files are mostly self-explanatory / human-readable (plus there are comments!).

The [main.sh](main.sh) script contains all the steps required to accomplish the given task.

<img src="https://github.com/JonathanSeriesX/dayoneXtwitter/blob/main/pics/chmod.jpg?raw=true" alt="chmod situation" width="600"/>

Terraform expects the variables `ssh_pub_key`, `root_pass`, and `token` for Linode.

Ansible expects the variables `ipa_ds_password`, `ipa_admin_password`, `user1_pass`, `user2_pass`, `user3_pass`, and `letsencrypt_email`.

These variables are not stored in the repository for security reasons.

## Known issues

- The application server must run Ubuntu 25.04, otherwise you'll encounter [this bug](https://bugs.launchpad.net/ubuntu/+source/freeipa/+bug/2078034). Since Linode does not yet provide the latest Ubuntu image, you must first execute [ansible/ubuntu_upgrade.yml](ansible/ubuntu_upgrade.yml) playbook to perform a manual `do-release-upgrade` of the app server before proceeding with `freeipa-client` installation.

## What could be done next?

- Automate DNS record creation with the Cloudflare API.
- Use user groups instead of assigning permissions to individual users.
