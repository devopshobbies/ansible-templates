

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
