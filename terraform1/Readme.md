# Terraform Project Configuration

This Terraform project deploys resources on Azure, including a Virtual Network (VNet), Subnet, Azure Container Registry (ACR), and Azure Kubernetes Service (AKS). Optionally, a Virtual Machine (VM) with a Network Security Group (NSG) and related networking resources can be created for running pipeline tasks, though a pod-based approach within AKS is currently preferred.

## Variables

Before running project create a file named `variables.tf`, along with their descriptions and examples where applicable.

### Required Variables for Resource Group and Network Configuration

- **`resource_group_name`**: *(string)*  
  Name of the Azure Resource Group to create or use.  
  Example: `"my-resource-group"`

- **`location`**: *(string)*  
  Azure region where resources will be created.  
  Example: `"East US"`

- **`vnet_name`**: *(string)*  
  Name of the Virtual Network (VNet).  
  Example: `"my-vnet"`

- **`vnet_address_space`**: *(string)*  
  Address space for the VNet in CIDR notation.  
  Example: `"10.0.0.0/16"`

- **`subnet_name`**: *(string)*  
  Name of the subnet within the VNet.  
  Example: `"my-subnet"`

- **`subnet_address_prefixes`**: *(list of strings)*  
  Address prefixes for the subnet in CIDR notation.  
  Example: `["10.0.1.0/24"]`

### Azure Container Registry (ACR) and Kubernetes Service (AKS) Variables

- **`acr_name`**: *(string)*  
  Name of the Azure Container Registry (ACR). Only alphabetic characters are allowed.  
  Example: `"myacrname"`

- **`aks_name`**: *(string)*  
  Name of the Azure Kubernetes Service (AKS) cluster.  
  Example: `"my-aks-cluster"`

- **`dns_prefix`**: *(string)*  
  DNS prefix for the AKS cluster.  
  Example: `"myaks"`

- **`node_count`**: *(number)*  
  Number of nodes in the AKS cluster.  
  Default: `2`

- **`acr_sku`**: *(string)*  
  SKU tier for ACR, such as `Basic`.  
  Example: `"Basic"`

- **`service_cidr`**: *(string)*  
  CIDR block for the Kubernetes services within AKS.  
  Example: `"10.0.0.0/16"`

### Optional VM Variables (For Alternative Pipeline Task Execution)

The following variables are for an optional VM setup, used when an external VM is preferred over a pod within the AKS cluster to execute pipeline tasks.

- **`nsg_name`**: *(string)*  
  Name of the Network Security Group (NSG) for the VM.  
  Example: `"my-nsg"`

- **`vm_name`**: *(string)*  
  Name of the Virtual Machine.  
  Example: `"pipeline-vm"`

- **`username`**: *(string)*  
  Username for accessing the VM.  
  Example: `"azureuser"`

- **`public_ip_name`**: *(string)*  
  Name for the Public IP associated with the VM.  
  Example: `"pipeline-vm-ip"`

- **`nic_name`**: *(string)*  
  Name of the Network Interface Card (NIC) for the VM.  
  Example: `"pipeline-vm-nic"`

---

## Running the Terraform Configuration

To deploy the infrastructure, follow these steps:

1. **Log in to Azure**:
   ```bash
   az login
   ```
2. **Initialize Terraform configuration**:
   ```bash
   terraform init
    ```
3. **Overview the planned changes**:
   ```bash
   terraform plan
    ```
4. **Apply changes**:
   ```bash
   terraform apply
    ```