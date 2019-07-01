[![Ansible Galaxy](https://img.shields.io/badge/Ansible%20Galaxy-NGINX-blue.svg)](https://galaxy.ansible.com/wluisaraujo/nginx) [![Build Status](https://travis-ci.org/wluisaraujo/ansible-role-nginx.svg?branch=master)](https://travis-ci.org/wluisaraujo/ansible-role-nginx)
---
# IaC: with [Ansible](https://www.ansible.com) role to install and configure [NGINX](https://nginx.org)
------------

Description
------------

 * Ansible role for NGINX
 
Requirements
------------

 *

Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

Dependencies
------------

* None

Example Playbook
----------------
```yaml
---
- hosts: localhost
  vars:
    - name: value
  roles:
    - nginx
...    
```

----------------
[![Licence](https://img.shields.io/badge/License-GPL%20v3-red.svg)](https://www.gnu.org/licenses/gpl-3.0.pt-br.html)
