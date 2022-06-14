## Ansible-Mattermost-Server
## Introducing Mattermost ChatOps: Open source, real-time DevOps

Mattermost is an open-source, self-hostable online chat service with file sharing, search, and integrations. It is designed as an internal chat for organisations and companies, and mostly markets itself as an open-source alternative to Slack and Microsoft Teams


## Integrations with DevOps tools
Mattermost ChatOps speeds up workflows and code reviews through DevOps tool integrations and accelerates rapid response with configurable alerting, notifications, and user interface plugins with platforms like Jenkins and GitHub and GitLab. You can get these plugins through their respective GitHub repos.

This Playbook installs **Mattermost Service** , A complete Mattermost installation consists of three major components: a proxy server, a database server, and the Mattermost server


## Here is the version information:
- **Mattermost Server** : 6.3.0
- **MySQL Database Server**: 5.7

## Note:
 - All these components have been installed on the same machine
- You should change the content of inevntory/target based on your target IP Address machine

```
ansible-playbook -i inevntory/target  mattermost.yml 
```
