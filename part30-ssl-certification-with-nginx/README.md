## Ansible  LEMP stack  on Debian 11
This playbook will activate ssl certification with lets encrypt free certification with http-01 acme_method and in nginx web server


### Settings in group_vars/all:
**acme_directory:** A directory will be created with this name in: /var/www/ <br />
**acme_version:** version of acme <br />
**acme_revoke:** Boolean varible that control revoking previous amce certification <br />
**acme_register_account:** The password for the MySQL root account. <br />
**acme_account_email:** The email that use to verify the domain by lets encrypt <br />
**project_path:** The path where the project exist on server<br />

**letsencrypt_dir:** The main directory the letsencrypt generate the data <br />
**letsencrypt_keys_dir:** Letsencrypt keys directory<br />
**letsencrypt_csrs_dir:** Letsencrypt CSRS key directory <br />
**letsencrypt_certs_dir:** Letsencrypt CERT key directory<br />
**letsencrypt_account_key:** Letsencrypt ACCOUNT key<br />
**letsencrypt_account_dir:** Letsencrypt ACCOUNT directory <br />
**acme_domain:** The domain that want to activate the ssl. <br />


### Run the Playbook:
```
ansible-playbook -l [target] -i [inventory file] -u [remote user] lemp.yml
```


## nginx config
add this line to nginx config file and restart it 
```
 ssl_certificate /etc/letsencrypt/{{acme_domain}}/certs/{{acme_domain}}-fullchain.pem; # Adjust path as necessary
 ssl_certificate_key /etc/letsencrypt/{{acme_domain}}/keys/{{acme_domain}}.key; # Adjust path as necessary

 ```
