# Basic Terraform provider elements that tell terraform that we will be using the vsphere provider

terraform {
  required_providers {
    vsphere = {
      source = "hashicorp/vsphere"
      version = "2.0.2"
    }
  }
}

#########################################################
# We assume that most of the variables below are being 
# populated from a tfvars file to protect internal 
# system information. You can change the default variable
# to match your environment, or you can create a tfvars
# file to set this so no changes are needed in this file.
#########################################################


variable "vsphere_user" {
  description = "User account used to log into vCenter server"
  type = string
  default = ""
}

variable "vsphere_server" {
  description = "The IP or FQDN of the vCenter server"
  type = string
  default = ""
}

variable "vsphere_password" {
  description = "Password used to logon to vCenter server"
  type = string
  default = ""
}

variable "vsphere_datacenter" {
  description = "The datacenter the VM will be created in"
  type = string
  default = ""
}

variable "vsphere_datastore" {
  description = "The datastore to be used for disk storage for the VM"
  type = string
  default = ""
}

variable "vsphere_iso_datastore" {
  description = "Datastore used for ISO files"
  type = string
  default = ""
}

variable "vsphere_resource_pool" {
  # Note: In this example we are not defining the cluster.
  #       This example will not work without a resource pool
  description = "Resource Pool the VM will be created in"
  type = string
  default = ""
  # Note: The examples for this provider show cluster name and resource pool together, but that is not accurate.
  #       Just put the resource pool name in the variable to ensure proper operation.
}

variable "vsphere_network" {
  description = "The network to place the adapter in"
  type = string
  default = ""
}

variable "vm_name" {
  description = "Name of the VM to be created"
  type = string
  default = ""
}

variable "vsphere_iso" {
  description = "The name of the ISO file to be mapped to the VM"
  type = string
  default = "ubuntu-21.04-live-server-amd64.iso"
}
/*
The locals define more constant variables that don't need to be changed unless you want to modify the VM to be created.
*/

locals {
  vm_cpu_count = 4 		# Number of Processors for the VM
  vm_memory = 4096		# Memory in MB 
  vm_guest_id = "ubuntu64Guest" # Guest Operation System Designation (https://code.vmware.com/apis/358/doc/vim.vm.GuestOsDescriptor.GuestOsIdentifier.html)
  vm_disk1_label = "boot" 	# Name of the disk for the first disk in the system
  vm_disk1_size = 25  		# Size of the disk for the first disk in the system
}

# These settings define the connection into the vCenter
provider "vsphere" {
  user           = var.vsphere_user
  password       = var.vsphere_password
  vsphere_server = var.vsphere_server

  # If you have a self-signed cert
  allow_unverified_ssl = true
}

# This mappes to an existing Datacenter Name based on the variable above, and does not create anything.
# We use this more for most recources in this example
data "vsphere_datacenter" "dc" {
  name = var.vsphere_datacenter
}

# Defines the datastorage to be used for VM Disk Storage. 
# Again, we are not creating anything here. The name in the variable must exist for this to work.
data "vsphere_datastore"  "datastore" {
  name = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Mapping to an existing resource pool. Depending on where you create the resource pool
# will determine which cluster the VM gets created on.
data "vsphere_resource_pool" "pool" {
  name = var.vsphere_resource_pool
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Existing Network Name to Map to
data "vsphere_network" "network" {
  name = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

# Datastore we can find the ISO in for mapping a CD
data "vsphere_datastore" "iso_datastore" {
  name = var.vsphere_iso_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

# This will be created or destoryed by Terraform as appropriate. 
# This defineds the VM to create.
resource "vsphere_virtual_machine" "vm" {
  name = var.vm_name
  resource_pool_id = data.vsphere_resource_pool.pool.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = local.vm_cpu_count
  memory           = local.vm_memory
  guest_id         = local.vm_guest_id
  # Normally, terraform wants to see the guest OS get an IP before it completes the VM creation process. In this case we don't wait for the IP
  wait_for_guest_net_routable = false
  wait_for_guest_net_timeout = 0
  wait_for_guest_ip_timeout = 0
  # Helps with destroying a VM. Not recommended for production.
  force_power_off = true
  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = local.vm_disk1_label
    size  = local.vm_disk1_size
  }
  cdrom {
    datastore_id = data.vsphere_datastore.iso_datastore.id
    path = var.vsphere_iso
  }
}

