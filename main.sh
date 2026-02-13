ansible-playbook lxc-setup.yml -u root
ansible-playbook mysql.yml
ansible-playbook pki-server.yml
ansible-playbook importing-ca-crt.yml
ansible-playbook bind9.yml


ansible-playbook vaultwarden.yml
ansible-playbook wordpress.yml
ansible-playbook nextcloud.yml

ansible-playbook Pterodactyl-panel.yml
# ansible-playbook Pterodactyl-wing.yml


ansible-playbook zabbix-server.yml
ansible-playbook zabbix-agent.yml

ansible-playbook snmp.yml


ansible-playbook haproxy.yml
ansible-playbook nginx-reverse-proxy.yml
