Zabbix Agent2
=========

This role install and setup zabbix-agent2 for auto-registration in zabbix-server(required create action on the zabbix panel)

Requirements
------------
 
 Ubuntu : 18.04 to 22.04

Role Variables
--------------

Some variables for zabbix-agent2 config:

zabbix_server_ip: ""
zabbix_port: "10050"
zabbix_timeout: "30"


Example Playbook
----------------

Usage:

    ansible-playbook play.yml [ --limit server-ip ]

License
-------

GPL-2.0-or-later

Author Information
------------------

Hamid Jahadi

Email: jahadi.hamid@gmail.com
github: https://github.com/jahadi-hamid
