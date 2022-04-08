Systems Ansible
===============


Simple ansible configuration of base systems accorss different environments.

✅ In this example we are going to create a user for DevOps engineers. this dedicated user will have root access to our server. 

⚠️ files you need to change before using the code:
- inventory
### initial step
Try this command to add your users key to the server so you can connect to it using your workstation.
```
ansible all -k -K -m authorized_key -a "user='your_username' state='present' key='{{lookup('file', ~/.ssh/id_rsa.pub)}}'"
```

Examples
--------

To run a particular configuration:
```
ansible-playbook  ansible-learning.yml
```

## Outcome
This playbook will create a user called "devops" in your server and makes it a sudo user.

