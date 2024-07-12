## Table of Contents
- [Test Ansible Role with Molecule(testinfra)](#test-ansible-role-with-moleculetestinfra)
  - [Install and Set Up Molecule](#install-and-set-up-molecule)
  - [Initialize test scenario with molecule](#initialize-test-scenario-with-molecule)
    - [Prepare the environment to test](#prepare-the-environment-to-test)
    - [Create Tests](#create-tests)
    - [Run the test](#run-the-test)
  - [Understanding the Molecule Test Sequence](#understanding-the-molecule-test-sequence)
  - [Resources](#resources)

# Test Ansible Role with Molecule(testinfra)

In the previous [Tutorial](../part31-testing-ansible-molecule/), we have explained how to use Molecule to test your Ansible roles with writing Ansible tasks. In this part, we will explain how to use Python code with the `Testinfra` module to verify our infrastructure working properly.

## Install and Set Up Molecule

First, install Molecule and the requirements:

```bash
python3 -m pip install ansible molecule ansible-core molecule-plugins testinfra
python3 -m pip install --user "molecule-plugins[docker]"
# We need docker to run our tests in the container
sudo apt install docker.io -y
```
## Initialize test scenario with molecule

We already have the molecule folder in this role if you don't make one by(We assume you don't have molecule folder, And you want to create one for your own roles):
First go to your role directory.
Then initiate a new test scenario:
```bash
cd roles/nginx
molecule init scenario
```
A new directory named `molecule` will be created, which contains the test scenarios.
Let's edit the `molecule/default/moleucle.yml` file to specify how we are going to do the tests for our role.
Replace the `molecule/default/moleucle.yml` with the following content make sure to use **testinfra** as a verifier in this section not Ansible:
```yaml
---
dependency:
  name: galaxy
driver:
  name: docker
platforms:
  - name: instance
    image: "geerlingguy/docker-ubuntu2204-ansible"
    cgroupns_mode: host
    command: /lib/systemd/systemd
    volumes:
      - /sys/fs/cgroup:/sys/fs/cgroup:rw
    privileged: true
    pre_build_image: true
scenario:
  name: default
verifier:
  name: testinfra
```
**Note**: As we want to run `systemd` in the container we need to give the container privileged access.
In the above configuration we are using Docker driver to run our tests. We are using ubuntu-2204 to test our NGINX deployment.
### Prepare the environment to test
The `molecule/default/converge.yml` file is used to prepare the environment, so edit the file:
```yaml
---
- name: Converge
  hosts: all
  gather_facts: false
  tasks:
    - name: Running the Nginx task
      ansible.builtin.include_role:
        name: nginx
```
Delete the `molecule/default/create.yml` and `molecule/default/destroy.yml` files.

### Create Tests
As we are deploying NGINX, we need to make sure it's properly up and running. Create a folder called `tests` under the molecule folder then add your Python test files like this `molecule/tests/test_service.py` like the following content to add these checks:
```python
def test_nginx_config_existence(host):
    nginx = host.file("/etc/nginx/nginx.conf")
    assert nginx.exists

def test_nginx_installed(host):
    nginx = host.package("nginx")
    assert nginx.is_installed

def test_nginx_running_and_enabled(host):
    nginx = host.service("nginx")
    assert nginx.is_running
    assert nginx.is_enabled

def test_nginx_listening(host):
    socket = host.socket("tcp://0.0.0.0:80")
    assert socket.is_listening
```
The above tests check if the Nginx configuration file exists, if Nginx is installed, if the Nginx service is running and enabled, and if Nginx is listening on port 80.

### Run the test
```bash
cd roles/nginx
molecule test
```
The above command will run the default scenario test specified in the `molecule/default` folder, executing the following test matrix: `dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, and destroy`.
You can use this command in your CI/CD pipelines to make sure you are not breaking any tests.

## Understanding the Molecule Test Sequence
If you want to execute a specific step using Molecule, the entire sequence of tests leading up to that step will be performed. For instance, if you run `molecule converge`, it triggers the following sequence: `dependency, cleanup, destroy, syntax, create, prepare`, and finally `converge`. Note that the verify step is not executed at this point.
So now you can do `molecule verify` and since the `destroy` has not been called you can even go to the container and check anything you want with `molecule login -h instance`, After you make sure everything is ok just do `molecule destroy`.

**Note**: When using molecule login, ensure you replace instance with the actual name of your instance as specified in your molecule.yml configuration.

## Resources
- Read more in [Molecule website](https://ansible.readthedocs.io/projects/molecule/)
