component=$1

ansible-playbook get-secrets.yml -e vault_token=$vault_token -e env=$env

#ansible-playbook -i $component-dev.dkdevops.online, -e "@~/secrets.json" -e "@~/newrelic.json" -e role_name=$component expense.yml -e env=$env

aws ec2 describe-instances --filters Name=tag:Name,Values=$component-$env Name=instance-state-name,Values=running --query 'Reservations[*].Instances[*].PrivateIpAddress' --output text >inv
ansible-playbook -i inv -e env=$env -e role_name=$component expense.yml -e '@~/secrets.json'

rm -f ~/*.json