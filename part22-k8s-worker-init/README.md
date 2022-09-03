Add K8S Worker-Node (Docker - Ubuntu)
=========

This role join  new servers to the K8S Cluster With kubeadm.

Requirements
------------

You need to have K8S Cluster and create server group of Master-Node in the ansible hosts file.

Role Variables
--------------

Some variables used by this role that you can find in defaul folder of the role and change them.

Dependencies
------------

This role depend on apt package-manager role for updating the server at first.
In meta folder you can find role dependency.
For update & upgrade the  server we used a role with a variable:

- role: package-manager
  vars:
    action: 'update'

By 'action' variable tell the package-manager role to do just update the server.

if Reboot required after update you can confirm to reboot the server then continue the tasks.:

" 'hostname' reboot required, please confirm reboot now: (yes or no):"


Example Playbook
----------------

Usage:

    ansible-playbook play.yml [ --limit server-ip ]

License
-------

GPL-2.0-or-later

Author Information
------------------

Hamid Jahadi

Email: jahadi.hamid@gmail.com
github: https://github.com/jahadi-hamid
