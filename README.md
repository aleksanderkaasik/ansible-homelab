# Homelab Automations with Ansible

A collection of Ansible playbooks to set up and configure a homelab environment.

These playbooks are designed to run on Ubuntu 24.04 LXC containers hosted on Proxmox.

## Prerequisites

Before getting started, make sure you have

* **Cloudflare API token**
  * `Zone` - `SSL and Certificates` with `Read` and `Write` permissions to all or specific zone/s
    
* **Python dependency**
  ```bash
  pip install passlib # To configure password to users
  ```

## Getting Started

### 1) Clone the Repository

```bash
git clone https://github.com/aleksanderkaasik/ansible-homelab.git
cd ansible-homelab
```

### 2) Configure Hosts

Edit the `hosts` file and add your homelab servers, including

> Note:  
> `ip_address` and `domain_name` are required for web appliavtions and generating SSL certifications  
> And for `uuid`, `token_id` and `token` varaibles that needs pterodactyl panel to geneeate them

### 3) Configure Variables

Update the variables in

```
variables/main.yml
```

Make sure all values match your environment.

### 4) Running the Playbooks

* ### *Option 1)* Run everything at once

  Make the script executable and run it

  **Linux / MacOS**

  ```bash
  chmod +x main.sh
  ./main.sh
  ```

  > Note:  
  > `pterodactyl-wing.yml` is currently excluded.  
  > The connection ID automation for Wings agents is not yet implemented.

* ### *Option 2)* Run playbooks individually

  You can also execute each playbook manually

  ```bash
  ansible-playbook playbook-name.yml
  ```

  Replace `playbook-name.yml` with the specific playbook you want to run.

  > Note:  
  > For fresh install of Uuntu LXC containers, use `ansible-playbook lxc-setup.yml -u root`  
