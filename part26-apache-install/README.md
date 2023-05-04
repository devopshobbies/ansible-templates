note:
* Before running, first put your desired IPs in the hosts.ini file.
* Put the desired ssh_key address in the ansible.cfg file.

To run this playbook:

```bash
ansible-playbook -i inventory/hosts.ini playbook.yml -K
```
