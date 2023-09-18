# linux-update

This role updates currently installed packages on RedHat and Debian linux machines

## Requirements

In this role 3 ansible modules has been used specified below:

- dnf
- yum
- apt

## Role Variables

There are some parameters specified in var/main.yml for reboot handler. you are free to chanage parameters based on your needs.

## Example Playbook

Including an example of how to use your role (for instance, with variables passed in as parameters) is always nice for users too:

    ansible-playbook play.yml [ --limit server-ip ]

## License

MIT

## Author Information

| Contributers | Masoud Maghsoudi                      | Ahmadali Bagheri                     |
| ------------ | ------------------------------------- | ------------------------------------ |
| Email        | <masoud_maghsoudi@yahoo.com>          | <ahmad@devopshobbies.com>            |
| Github       | <https://github.com/masoud-maghsoudi> | <https://github.com/ahmadalibagheri> |
