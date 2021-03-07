## Documentation

* Explore the Terraform for Terraform [CLI](https://www.terraform.io/downloads.html) >= v1.0+
* Explore the Nodejs for npm [CLI](https://nodejs.org/en/) >= v14+
* Explore the Yarn for Yarn [CLI](https://classic.yarnpkg.com/en/docs/install#debian-stable) >= v1.21 (optional - NPM will work as an alternative)
* Explore the CDK for cdktf [CLI](https://github.com/hashicorp/terraform-cdk#build)


Systems Ansible
===============


Simple ansible configuration of base systems accorss different environments.


Examples
--------

To run a particular configuration:
```
ansible-playbook -i inventories/ teamcityagent-config.yml --ask-vault-pass
```
vault password:123
