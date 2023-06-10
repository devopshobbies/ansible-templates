Very First Step
========

Install Python using ansible module `raw` since any other ansible module, such as `apt`, needs python installed:

```
ansible-playbook -i hosts.yml -u root python.yml
```
