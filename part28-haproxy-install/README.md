<h1 align="center">
 <img alt="HAProxy Logo" src="./files/Haproxy-logo.png">
</h1>

# HAProxy

This role install and cofigure HAProxy

## Requirements

Ubuntu

Debian

RedHat Family

## Role Variables

Some variables for HAProxy config:

**haproxy_frontend_port** : 80

**haproxy_frontend_mode** : http

**haproxy_backend_balance_method** : roundrobin

**haproxy_connect_timeout** : 5000

**haproxy_client_timeout** : 50000

**haproxy_server_timeout** : 50000

## Example Playbook

Usage:

    ansible-playbook play.yml [ --limit server-ip ]

## License

GPL-2.0-or-later

## Authors Information

| Contributers | Mehran Asghari _(Author)_          | Masoud Maghsoudi                      |
| ------------ | ---------------------------------- | ------------------------------------- |
| Email        | <mhr.as1317@gmail.com>             | <masoud_maghsoudi@yahoo.com>          |
| Github       | <https://github.com/mehranasghari> | <https://github.com/masoud-maghsoudi> |
