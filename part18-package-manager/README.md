Apt Package Manager
=========

By this role we can install group of apt pkgs on the target servers or update and upgrade the servers.

Requirements
------------

We need to send a list of apt package-name to ths role for install them.

Role Variables
--------------

pkgs_list:  'a list of apt package to install should be send to the role'
action: "install" or "update"
reboot: "yes" or "no(default)" 'if reboot required after update or installing prompt to confirm for reboot the server'


Example Playbook
----------------

this role used in 2 mode:

1.apt install:

- hosts: localhost
  become: true
  vars:
    some_pkgs:
      - kubectl
      - kubeadm
      - ...
  roles:
    - role: package-manager
      vars:
        pkgs_list: "{{ some_pkgs }}"
        action: 'install'


2.apt update

- hosts: localhost
  become: true
  roles:
    - role: package-manager
      vars:
        action: 'update'

License
-------

GPL-2.0-or-later

Author Information
------------------

Hamid Jahadi

Email: jahadi.hamid@gmail.com
github: https://github.com/jahadi-hamid
