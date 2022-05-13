Systems Ansible
===============


An example of ansible configuration to install docker swarm and create a cluster with masters and workers


Examples
--------

To run a particular configuration:
```
ansible-playbook -i inventories/ ansible-learning.yml
```


Tags
--------

If you need to run just part of the tasks, you can use `tags`

Available tags in this configuration is: `docker-swarm-install` and `docker-swarm-config`

for example to run just the `cluster configuration` tasks, use the `docker-swarm-config` tag:
```
ansible-playbook -i inventories/ ansible-learning.yml --tags 'docker-swarm-config'
```


Cluster nodes 
===============

You need to add all of your cluster nodes to the inventory file. and then specify `local-ip` and `node role` of each node as a configuration variable

inventory file example:
```
[cluster]
manager_1 ansible_host=3.2.1.4 local_ip=192.168.1.1 role=manager
manager_2 ansible_host=3.2.1.5 local_ip=192.168.1.2 role=manager
manager_3 ansible_host=3.2.1.6 local_ip=192.168.1.3 role=manager
manager_4 ansible_host=3.2.1.7 local_ip=192.168.1.4 role=manager
worker_1 ansible_host=3.2.1.8 local_ip=192.168.1.5 role=worker
worker_2 ansible_host=3.2.1.9 local_ip=192.168.1.6 role=worker
```



Linux distros
===============

This ansible configuration can handle `debian` based and `redhat` based linux distros `(default value: debian)`

You can change the distro value in the `vars` section in the playbook, or change the default value in `tasks > defaults folder`