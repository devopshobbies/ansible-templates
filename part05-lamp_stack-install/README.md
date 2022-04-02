# LAMP stack on Ubuntu
This playbook will install a LAMP environment (Linux, Apache, MySQL and PHP) on an Ubuntu 18.04 machine. A virtualhost will be created with the options specified in the vars/default.yml variable file.

##Settings

- mysql_root_password: the password for the MySQL root account.
- app_user: a remote non-root user on the Ansible host that will own the application files.
- http_host: your domain name.
- http_conf: the name of the configuration file that will be created within Apache.
- http_port: HTTP port, default is 80.
- disable_default: whether or not to disable the default Apache website. When set to true, your new virtualhost should be used as default website. Default is true.

## Running this Playbook

### Customize Options
```
    nano vars/default.yml
```

### Run the Playbook
```
ansible-playbook -l [target] -i [inventory file] -u [remote user] playbook.yml
```