## Table of Contents
- [Test Ansible Role with Molecule](#test-ansible-role-with-molecule)
  - [Install and Set Up Molecule](#install-and-set-up-molecule)
  - [Initialize test scenario with molecule](#initialize-test-scenario-with-molecule)
    - [Prepare the environment to test](#prepare-the-environment-to-test)
      - [Create Tests](#create-tests)
      - [Run the test](#run-the-test)
      - [Understanding the Molecule Test Sequence](#understanding-the-molecule-test-sequence)
  - [Resources](#resources)

# Test Ansible Role with Molecule

A very simple example of a role that deploys NGINX and checks if it's up and running. The Molecule project is designed to aid in the development and testing of Ansible roles. Molecule provides support for testing with multiple instances, operating systems and distributions, virtualization providers, test frameworks, and testing scenarios.

In this role, we only deploy NGINX, then we run our tests to make sure NGINX is up and running.



## Install and Set Up Molecule

First, install Molecule and the requirements:

```bash
python3 -m pip install ansible molecule ansible-core molecule-plugins
python3 -m pip install --user "molecule-plugins[docker]"
# We need docker to run our tests in the container
sudo apt install docker.io -y
```
## Initialize test scenario with molecule

We already have the molecule folder in this role if you don't make one by(We assume you don't have molecule folder, And you want to create one for your own roles):
First go to your role directory.
Then initiate a new test scenario:
```bash
molecule init scenario
```
A new directory named `molecule` will be created, which contains the test scenarios.
Let's edit the `molecule/default/moleucle.yml` file to specify how we are going to do the tests for our role.
Replace the `molecule/default/moleucle.yml` with the following content:
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
  name: ansible
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

#### Create Tests
As we are deploying NGINX, we need to make sure it's properly up and running. Create a `verify.yml` file in `molecule/default/` with the following content to add these checks:
```yaml
---
- name: Test NGINX deployment
  hosts: all
  become: yes
  tasks:
    - name: Verify Nginx is serving web requests.
      uri:
        url: http://localhost/
        status_code: 200
```
#### Run the test
```bash
molecule test
```
The above command will run the default scenario test specified in the `molecule/default` folder, executing the following test matrix: `dependency, cleanup, destroy, syntax, create, prepare, converge, idempotence, side_effect, verify, cleanup, and destroy`.
You can use this command in your CI/CD pipelines to make sure you are not breaking any tests.

#### Understanding the Molecule Test Sequence
If you want to execute a specific step using Molecule, the entire sequence of tests leading up to that step will be performed. For instance, if you run `molecule converge`, it triggers the following sequence: `dependency, cleanup, destroy, syntax, create, prepare`, and finally `converge`. Note that the verify step is not executed at this point.
So now you can do `molecule verify` and since the `destroy` has not been called you can even go to the container and check anything you want with `molecule login -h instance`, After you make sure everything is ok just do `molecule destroy`.

**Note**: When using molecule login, ensure you replace instance with the actual name of your instance as specified in your molecule.yml configuration.

## Resources
- Read more in [Molecule website](https://ansible.readthedocs.io/projects/molecule/)
