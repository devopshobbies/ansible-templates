# Change hostname and update ``/etc/hosts`` file

### Before everything first update inventory file.

### Then update your desired hostnames:
- add ``<host_name>.yml`` file for each of your hosts in ``/host_vars`` directory
- add this line to every ``<host_name>.yml`` file: 

    ```bash 
    hostname: <desired_hostname>
    ```
    
## Execute playbook

```bash
ansible-playbook tasks/main.yml
```
