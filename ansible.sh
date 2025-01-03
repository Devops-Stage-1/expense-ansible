component=$1

ansible-playbook get-secrets.yml -e vault_token=$vault_token env=$env

ansible-playbook -i $component-dev.dkdevops.online, -e "@~/secrets.json" -e "@~/newrelic.json" -e role_name=$component expense.yml -e env=$env

rm -f ~/secrets.json ~/newrelic.json