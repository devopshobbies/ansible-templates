Systems Ansible
===============


Simple ansible configuration of base systems accorss different environments.


Examples
--------

To run a particular configuration:
```
ansible-playbook -K create-user.yml
```

Build inventory
---------------

- [How to build your inventory](https://docs.ansible.com/ansible/latest/user_guide/intro_inventory.html)

privilege escalation
--------------------

- [Understanding privilege escalation](https://docs.ansible.com/ansible/latest/user_guide/become.html)

Manage user
-----------

- [Manage user accounts](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html#return-password)
