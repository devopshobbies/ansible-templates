Sysctl Configuration
=========

With this role you can set some performance configuration of linux kernel.


Role Variables
--------------

You need to choose one of the pre-prepared group of sysctl parameters from the dictionary.
for example choosing 'kuber' set some configuration in sysctl for K8S worker nodes. you can make you dictionary in the default directory.


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
