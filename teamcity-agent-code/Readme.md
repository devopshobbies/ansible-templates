## Documentation

* Explore the Terraform for Terraform [CLI](https://www.terraform.io/downloads.html) >= v1.0+
* Explore the Nodejs for npm [CLI](https://nodejs.org/en/) >= v14+


Systems Ansible
===============


Simple ansible configuration of base systems accorss different environments.


Examples
--------

To run a particular configuration:
```
ansible-playbook -i inventories/ teamcityagent-config.yml --ask-vault-pass
```
vault password:123
