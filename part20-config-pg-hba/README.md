Access Rules of pg_hba
=========

With this role you can open access to postgres DBs by add access rule of the target server-ip to pg_hba file.

Requirements
------------

you need to create a list of your DB's IP , Version and pg_hba PATH for setting configuration.

Role Variables
--------------

This role have a variable of the list of postgres servers:
- pg_db_list


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
