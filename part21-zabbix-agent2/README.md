<h1 align="center">
 <img alt="Ansible Logo" src="./files/Zabbix_logo.png">
</h1>

# Zabbix Agent2

This role install and setup zabbix-agent2 for auto-registration in zabbix-server
(required create action on the zabbix panel)

## Requirements

**Ubuntu** : 18.04 to 22.04

**Debian** : 9 to 12

**RedHat Family** : 6 to 8

## Role Variables

Some variables for zabbix-agent2 config:

**zabbix_server_ip** : ""

**zabbix_port** : "10050"

**zabbix_timeout** : "30"

## Example Playbook

Usage:

    ansible-playbook play.yml [ --limit server-ip ]

## License

GPL-2.0-or-later

## Authors Information

| Contributers | Hamid Jahadi _(Author)_           | Masoud Maghsoudi                      |
| ------------ | --------------------------------- | ------------------------------------- |
| Email        | <jahadi.hamid@gmail.com>          | <masoud_maghsoudi@yahoo.com>          |
| Github       | <https://github.com/jahadi-hamid> | <https://github.com/masoud-maghsoudi> |
