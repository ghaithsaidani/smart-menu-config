variable "resource_group_name" {
  default = "" # resource group name (string)
}

variable "location" {
  default = "" # resource group location (string)
}

variable "vnet_name" {
  default = "" # virtual network name (string)
}

variable "vnet_address_space" {
  default = "" # virtual network address space example 10.0.0.0/16 (string)
}

variable "subnet_name" {
  default = "" # subnet name (string)
}

variable "subnet_address_prefixes" {
  default = [] # subnet address prefixes example ["10.0.1.0/24"] (list of string)
}



variable "acr_name" {
  default = "" # azure registry containers name (string) is contains only alphabetic 
}

variable "aks_name" {
  default = "" # azure kubernetes service name (string)
}

variable "dns_prefix" {
  default = "" # dns prefix (string)
}

variable "node_count" {
  default = 2 # number of nodes in my cluster (number)
}

variable "acr_sku" {
  default = "" # azure registry container service type example Basic (string)
}

variable "service_cidr" {
  default = "" # service cidr example 10.0.0.0/16
}

# those variables for my first approach when i add another seperate vm to make the task of running pipeline but after that i used a pod and distributed agents
# that runs on my kubernetes cluster

variable "nsg-name" {
  default = "" # network security group name (string)
}

variable "vm_name" {
  default = "" # vm name (string)
}

variable "username" {
  default = "" # username of vm (string)
}

variable "public_ip_name" {
  default = "" # public ip name (string)
}

variable "nic_name" {
  default = "" # network interface for vm name (string)
}

