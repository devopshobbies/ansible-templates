## Ansible Zabbix Server on Debian 11
This Playbook installs **Zabbix Server 6 LTS** on **Debian 11**. This script is based on [Zabbix install Documentation](https://www.zabbix.com/download?zabbix=6.0&os_distribution=debian&os_version=11_bullseye&db=mysql&ws=nginx "Zabbix install Documentation") and it is production-ready, but you need to create mysql backup scripts and firewall rules manually. Before running this play book on your server, please take a look at [Zabbix Hardware Requirements](https://www.zabbix.com/documentation/current/en/manual/installation/requirements "Zabbix Hardware Requirements") to make sure you have enough hardware resources. <br />

### Here is the version information:
**Zabbix-Server:** 6 LTS <br />
**Nginx:** 1.18.0 <br />
**MariaDB:** 10.5.15 <br />
**PHP:** 7.4 <br />

### Settings in group_vars/all:
**hostname:** Domain name or server name (in this case: example.com) <br />
**nginx_port:** zabbix console will listen on this port <br />
**mysql_zabbix_database:** Database name for zabbix <br />
**mysql_root_password:** The password for the MySQL root account. <br />
**mysql_zabbix_user:** This is the user that the zabbix application uses to talk to mysql. <br />
**mysql_zabbix_password:** zabbix mysql account password <br />

### important note;
The default credentials for the zabbix server console are:
**username:** Admin
**passwrod:** zabbix
**Caution:** make sure you change the password after you log in.

### Run the Playbook:
```
ansible-playbook -l [target] -i [inventory file] -u [remote user] playbook.yml
```

