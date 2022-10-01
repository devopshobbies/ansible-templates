Jenkins-with_plugins_version-install
=========

Install & Setup Jenkins On Ubuntu Server



Role Variables
--------------

Creat list of the plugins that you want to add to the jenkins like this:

```
jk_plugins:
  configuration-as-code:
    enabled: true
  structs:
    enabled: True
  folders:
    enabled: True
  script-security:
    enabled: True
  branch-api:
    enabled: True
  job-dsl:
    version: 1.79
    enabled: true
    pinned: true
```
You can specify the version of the plugins like "job-dsl:1.79"




Example Playbook
----------------

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    - hosts: all
      become: true
      roles:
        - part24-jenkins-jcasc

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