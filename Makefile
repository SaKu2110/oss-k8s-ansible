all:
deploy:
	ansible-playbook -i inventory/production cluster.yml
development:
	ansible-playbook -i inventory/development cluster.yml
test:
	ansible-playbook -i inventory/development cluster.yml -–check