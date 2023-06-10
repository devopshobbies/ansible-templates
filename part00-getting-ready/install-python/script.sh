#!/bin/bash

declare -A OS_INFO;
OS_INFO[/etc/debian_version]="apt"
OS_INFO[/etc/alpine-release]="apk"
OS_INFO[/etc/centos-release]="yum"
OS_INFO[/etc/fedora-release]="dnf"

for RELEASE_FILE in ${!OS_INFO[@]}
do
    if [[ -f $RELEASE_FILE ]];then
        PKG_MANAGER=${OS_INFO[$RELEASE_FILE]}
    fi
done

$PKG_MANAGER update -y
$PKG_MANAGER install -y python3 python3-pip
