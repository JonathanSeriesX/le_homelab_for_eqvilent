# assumes you have terraform and ansible installed
terraform -chdir=terraform apply -auto-approve
ssh-keyscan -H $(terraform -chdir=terraform output -raw app_ip) >> ~/.ssh/known_hosts # not tested!
ssh-keyscan -H $(terraform -chdir=terraform output -raw ipa_ip) >> ~/.ssh/known_hosts # not tested!
ansible-galaxy install -r ansible/requirements.yml
ansible-playbook ansible/main.yml
