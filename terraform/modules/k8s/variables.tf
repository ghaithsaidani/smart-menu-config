variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "location" {
  description = "Region of the azure docker registery"
  type = string
}

variable "aks_name" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable "node_count" {
  type = number
}
variable "subnet_id" {
  type = string
}

variable "service_cidr" {
  type = string
}

/* variable "scope" {
  type = string
} */


/* variable "ssh_public_key" {
  type = string  
} */