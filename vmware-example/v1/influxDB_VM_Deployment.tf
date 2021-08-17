terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}

variable "vsphere_user" {
  type = string
  default = ""
}

variable "vsphere_server" {
  type = string
  default = ""
}

variable "vsphere_password" {
  type = string
  default = ""
}

variable "vsphere_datacenter" {
  type = string
  default = ""
}

variable "vsphere_datastore" {
  type = string
  default = ""
}

variable "vsphere_iso_datastore" {
  type = string
  default = ""
}

variable "vsphere_resource_pool" {
  type = string
  default = ""
}

variable "vsphere_network" {
  type = string
  default = ""
}

variable "vm_name" {
  type = string
  default = ""
}

variable "vsphere_iso" {
  type = string
  default = "ubuntu-21.04-live-server-amd64.iso"
}

provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

data "vsphere_datastore"  "datastore" {
  name = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_resource_pool" "pool" {
  name = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "network" {
  name = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_datastore" "iso_datastore" {
  name = var.vsphere_iso_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "influxdb_vm" {
  name = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id = data.vsphere_datastore.datastore.id
  num_cpus = 4
  memory = 4096
  guest_id = "ubuntu64Guest"
  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout = 0
  force_power_off = true
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "boot"
    size  = 64
  }
  cdrom {
    datastore_id = data.vsphere_datastore.iso_datastore.id
    path = var.vsphere_iso
  }
}

