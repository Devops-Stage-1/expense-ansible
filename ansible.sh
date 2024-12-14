component=$1

ansible-playbook get-secrets.yml -e vault_token=$vault_token

ansible-playbook -i $component-dev.dkdevops.online, -e "@~/secrets.json" -e "@~/newrelic.json" expense.yml -e role_name=$component

rm -f ~/secrets.json ~/newrelic.json