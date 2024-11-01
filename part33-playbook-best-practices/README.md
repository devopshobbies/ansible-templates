# Playbook Optimization and Best Practices
- [Playbook Optimization and Best Practices](#playbook-optimization-and-best-practices)
  - [Key Principles](#key-principles)
    - [1. Write Idempotent Playbooks](#1-write-idempotent-playbooks)
    - [2. Minimize Task Execution with `when` and `changed_when`](#2-minimize-task-execution-with-when-and-changed_when)
    - [3. Use Roles and Reusable Components](#3-use-roles-and-reusable-components)
    - [4. Use `block` and `rescue` for Error Handling](#4-use-block-and-rescue-for-error-handling)
    - [5. Leverage Variables and Group Variables](#5-leverage-variables-and-group-variables)
    - [6. Optimize Loops and Filters](#6-optimize-loops-and-filters)
    - [7. Use Templates and Avoid Hard-Coding](#7-use-templates-and-avoid-hard-coding)
    - [8. Test and Validate Playbooks with Molecule](#8-test-and-validate-playbooks-with-molecule)
  - [Examples](#examples)
    - [Example 1: Avoid Repeated Task Execution with Conditional `when`](#example-1-avoid-repeated-task-execution-with-conditional-when)
    - [Example 2: Using `block` and `rescue` for Error Handling](#example-2-using-block-and-rescue-for-error-handling)
    - [Example 3: Role-Based Playbook Organization](#example-3-role-based-playbook-organization)
  - [Sample Playbooks](#sample-playbooks)

After having covered the fundamentals in our previous `32 parts`, it's essential now to focus on optimizing and implementing best practices in Ansible playbooks, to ensure we'll have efficient, maintainable, and reliable infrastructure. This guide provides expert advice, practical tips, and real-world examples to enhance your playbook performance and readability.

## Key Principles

### 1. Write Idempotent Playbooks
Ensure that playbooks are idempotent, meaning they can be executed multiple times without changing the outcome. This is a core principle in Ansible to avoid unwanted changes.

### 2. Minimize Task Execution with `when` and `changed_when`
Use conditional statements (`when`) to skip tasks when not necessary. Additionally, define `changed_when` to specify when a task should indicate a change, avoiding unnecessary downstream executions.

### 3. Use Roles and Reusable Components
Break down playbooks into roles for modularity and reusability. Each role should have a single responsibility, making it easier to manage and reuse.

### 4. Use `block` and `rescue` for Error Handling
Blocks allow for structured error handling in playbooks. Use `rescue` blocks to handle failures gracefully, and `always` blocks for cleanup tasks.

### 5. Leverage Variables and Group Variables
Organize variables efficiently by using `group_vars`, `host_vars`, and `defaults`. This keeps playbooks clean and separates configuration data from task logic.

### 6. Optimize Loops and Filters
Avoid running repetitive tasks individually; instead, use loops where possible. Use `with_items` or `loop` to iterate over items efficiently, and filters to manage data within loops.

### 7. Use Templates and Avoid Hard-Coding
Templates allow you to dynamically generate configuration files, avoiding hard-coded values in playbooks. Use `Jinja2` templates (`.j2` files) to keep configuration files flexible.

### 8. Test and Validate Playbooks with Molecule
Use Molecule for local testing of playbooks(we have discussed about molecule in [part31](../part31-testing-ansible-molecule/) and [part32](../part32-testing-ansible-molecule/)), verifying that tasks execute as expected. This can prevent unexpected behavior in production environments.



## Examples

### Example 1: Avoid Repeated Task Execution with Conditional `when`

```yaml
# A sample playbook using the `when` statement to conditionally execute tasks

- name: Update and upgrade only if needed
  hosts: all
  become: yes
  tasks:
    - name: Check if package cache is updated
      stat:
        path: /var/lib/apt/periodic/update-success-stamp
      register: cache_file

    - name: Update apt package cache
      apt:
        update_cache: yes
      when: cache_file.stat.exists == false
```

### Example 2: Using `block` and `rescue` for Error Handling
```yaml
- name: Perform critical operations with error handling
  hosts: all
  tasks:
    - block:
        - name: Install essential packages
          apt:
            name: "{{ item }}"
            state: present
          loop:
            - curl
            - vim

      rescue:
        - name: Log the error
          debug:
            msg: "Failed to install essential packages. Please check logs."
```
### Example 3: Role-Based Playbook Organization

Organizing playbooks with roles keeps playbooks modular and reusable. Below is an example of a role structure
Using `ansible-galaxy` as a tool could beneficial:

```bash
ansible-galaxy init common
```
This command generates a directory structure for the `common` role:
```css
common/
├── README.md
├── defaults/
│   └── main.yml
├── files/
├── handlers/
│   └── main.yml
├── meta/
│   └── main.yml
├── tasks/
│   └── main.yml
├── templates/
├── tests/
│   ├── inventory
│   └── test.yml
└── vars/
    └── main.yml
```
Each directory serves a specific purpose:

- `tasks/`: Define tasks for this role.
- `templates/`: Store Jinja2 templates.
- `handlers/`: Define tasks that trigger upon specific - events (like restarts).
- `vars/` and `defaults/`: Define role-specific variables.


## Sample Playbooks
- See more examples at [Ansible-examples](https://github.com/ansible/ansible-examples).