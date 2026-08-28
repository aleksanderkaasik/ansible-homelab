# Homelab Automations with Ansible

A collection of Ansible playbooks to set up and configure a homelab environment.

These playbooks are designed to run on Ubuntu 24.04 LXC containers hosted on Proxmox.

## Prerequisites

Before getting started, make sure you have on your management computer.

* **Software**
  * Ansible
  * Terraform
  * Python

* **Cloudflare API tokens**
  * First api token: `Zone` - `SSL and Certificates` with `Read` and `Write` permissions to all or specific zone/s
  * Second api token: `Zone` - `DNS` with `Read` and `Write` permissions to all or specific zone/s

* **Proxmox api**

* **Python dependency**
  ```bash
  pip install passlib # To configure password to users for ansible
  ```

## Getting Started

### 1) Clone the Repository

```bash
git clone https://github.com/aleksanderkaasik/HomeLab
cd ansible-homelab
```

### 2) Configure Variables

Modifies variables files in the `variables/` directory

Create an terraform variable

``` shell
cp credentials.example credentials.auto.tfvars
```
Then edit `credentials.auto.tfvars` file with your proxmox server credential.

### 3) Setup the instance for the lab 

Initialize terraform with modules and addons
``` bash
terraform init
```

Applying terraform to generate infrastructure, with vms dns records
``` bash
terraform apply
```

### 4) Configure Hosts

After running terraform code to set up instance homelab infrastructure, then run a script to generate hosts for ansible hosts file, first edit the `Ansible_And_SSH_Hosts_Generator.py` add credential for the proxmox, and output mode.

Then run script

``` bash
python scripts/Ansible_And_SSH_Hosts_Generator.py > hosts.ini
```

### 5) Running the Playbooks

* ### *Option 1)* Run everything at once

  Make the script executable and run it

  **Linux / MacOS**

  ```bash
  chmod +x scripts/Run_All_Ansible_Playbooks.sh
  scripts/Run_All_Ansible_Playbooks.sh
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
