#!/bin/bash
apt update
apt install -y curl
compose_version=$(curl -Ls -o /dev/null -w %{url_effective}  https://github.com/docker/compose/releases/latest  | grep -o '[^/]*$')
sed -i -E "s#compose_version:(.*)#compose_version: ${compose_version}#g" vars/docker.yml
ansible-playbook -i hosts -u root tasks/main.yml
