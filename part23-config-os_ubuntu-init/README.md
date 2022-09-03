OS Initial Configuration (Ubuntu-Debian)
=========

This role  setup OS with some basic configuration:

- Update and Upgrade
- Enable Auto-Completion Bash
- Config TimeZone & NTP
- Set Some public sysctl configuration by the role
- Install & Config Zabbix-Agent2 by the role



Role Variables
--------------

You can find Variales of Zabbix-agent2 and sysctl Configuration in the related roles.


Dependencies
------------

This role Use 2 role:
- Apt package manager (for update)
- Sysctl Configuration
- Zabbix Agent2 

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