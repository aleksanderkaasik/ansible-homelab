resource "proxmox_lxc" "pki-server" {
  target_node     = var.proxmox_node_name
  hostname        = "pki-server"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "bind9" {
  target_node     = var.proxmox_node_name
  hostname        = "bind9"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "mysql" {
  target_node     = var.proxmox_node_name
  hostname        = "mysql"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "vaultwarden" {
  target_node     = var.proxmox_node_name
  hostname        = "vaultwarden"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "wordpress" {
  target_node     = var.proxmox_node_name
  hostname        = "wordpress"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "pterodactyl-panel" {
  target_node     = var.proxmox_node_name
  hostname        = "pterodactyl-panel"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "pterodactyl-wing" {
  target_node     = var.proxmox_node_name
  hostname        = "pterodactyl-wing"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 4
  memory          = 16384
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
    keyctl = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "32G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "zabbix-server" {
  target_node     = var.proxmox_node_name
  hostname        = "zabbix-server"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "nextcloud" {
  target_node     = var.proxmox_node_name
  hostname        = "nextcloud"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  mountpoint {
    key     = "0"
    slot    = 0
    storage = "CloudStorage"
    mp      = "/mnt/CloudStorage"
    size    = "4T"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "nginx-reverse" {
  target_node     = var.proxmox_node_name
  hostname        = "reverse"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}

resource "proxmox_lxc" "haproxy" {
  target_node     = var.proxmox_node_name
  hostname        = "haproxy"
  ostemplate      = var.os_image
  password        = var.proxmox_vm_password
  unprivileged    = true
  start           = true
  cores           = 2
  memory          = 4096
  tags            = "production;ubuntu"
  ssh_public_keys = var.public_ssh_key
  onboot          = true

  network {
    name     = "eth0"
    bridge   = "vmbr0"
    ip       = "dhcp"
    firewall = false
  }

  features {
    nesting = true
  }

  rootfs {
    storage = "VM-Storage"
    size    = "16G"
  }

  lifecycle {
    ignore_changes = [
      ostemplate,
      password,
      ssh_public_keys
    ]
  }
}
