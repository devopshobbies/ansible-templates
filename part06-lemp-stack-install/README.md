## Ansible  LEMP stack  on Debian 11
This playbook will install  **LEMP Stack** on debian 11. To run this script you need to have a fresh VPS with debian 11 installed. The minimum hardware requirements for the server is: <br />
**CPU:** 2 vCores or more <br />
**RAM:** 2 Gigabytes or more <br />
**DISK:** 20 Gigabytes or more <br />

### Here is the version information:
**Nginx:** 1.18.0 <br />
**MariaDB:** 10.5.15 <br />
**PHP:** 8.1.6 <br />

### Settings in group_vars/all:
**hostname:** Domain name or server name (in this case: example.com) <br />
**project_name:** A directory will be created with this name in: /var/www/ <br />
**nginx_port:** nginx will listen on this port <br />
**mysql_root_password:** The password for the MySQL root account. <br />

### Run the Playbook:
```
ansible-playbook -l [target] -i [inventory file] -u [remote user] lemp.yml
```
