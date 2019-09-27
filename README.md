[![Ansible Galaxy](https://img.shields.io/badge/Ansible%20Galaxy-NGINX-blue.svg)](https://galaxy.ansible.com/wluisaraujo/nginx) [![Build Status](https://travis-ci.org/wluisaraujo/ansible-role-nginx.svg?branch=master)](https://travis-ci.org/wluisaraujo/ansible-role-nginx) [![Docker Pulls](https://img.shields.io/badge/docker%20pulls-99-blue)](https://hub.docker.com/r/wluisaraujo/nginx/)
---
# IaC: with [Ansible](https://www.ansible.com) role to install and configure [NGINX](https://nginx.org)
------------

Description
------------

 * Ansible role for NGINX

Requirements
------------

 *

Installation
------------

```console
vagrant@localhost:~$ ansible-galaxy install wluisaraujo.nginx
```

Role Variables
--------------

[defaults/main.yml](defaults/main.yml)

```yaml
   vars:
     - mydomain: define o dominio do ambiente
     - server01: server 1 do balanceamento de carga
     - server01: server 2 do balanceamento de carga
```

Dependencies
------------

* None

Example Playbook
----------------

```yaml
---
- hosts: all
  roles:
    - { role: nginx, MEUDOMINIO: EXEMPLO.NET }
...
````

----------------
[![Licence](https://img.shields.io/badge/License-GPL%20v3-red.svg)](https://www.gnu.org/licenses/gpl-3.0.pt-br.html)
