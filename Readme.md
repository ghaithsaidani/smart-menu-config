# DevOps Infrastructure and Automation Project

This project provides an end-to-end DevOps automation solution, which includes the setup of Azure infrastructure using Terraform, Kubernetes configurations for managing applications on AKS (Azure Kubernetes Service), monitoring tools (Prometheus and Grafana), and Ansible playbooks for dependency installations on virtual machines. 

The project is organized into three main directories:

1. **terraform/**: Contains the infrastructure setup for Azure resources using Terraform.
2. **k8s/**: Contains Kubernetes configurations for deploying applications, including Jenkins, monitoring tools (Prometheus and Grafana), and ingress setup.
3. **ansible/**: Contains Ansible playbooks for dependency installation, particularly for Jenkins when hosted on a separate VM and for setting up monitoring tools.

## Project Structure


### **terraform/**

The **terraform/** folder is used to provision infrastructure resources on Azure using Terraform. It includes resources such as virtual machines, storage accounts, and network configurations needed to support the applications.

- `main.tf`: This file contains the core Terraform configurations for creating the necessary Azure resources.
- `providers.tf`: Contains the configuration for the Terraform provider (in this case, Azure).
- `variables.tf`: Defines the input variables used in the Terraform configurations if you enter to the folder you will see a complete guide how to install this `variables.tf` file.
- `modules/`: This folder contains modular Terraform configurations for different components of the Azure infrastructure, each module contains 3 files `main.tf`, `output.tf` and `variables.tf` you read more about this structure [here](https://developer.hashicorp.com/terraform/language/values).

#### To apply the Terraform configurations:
1. Login to Microsoft Azure by running 
```bash 
az login
```
2. Navigate to the `terraform/` directory and run:

```bash
terraform init
terraform plan
terraform apply
```

### **k8s/**

The **k8s/** folder contains the Kubernetes manifests and configurations needed to deploy and manage applications in your AKS (Azure Kubernetes Service) cluster. This includes the setup of Jenkins for CI/CD, the configuration of monitoring tools (Prometheus and Grafana), and the necessary ingress configurations for routing traffic to the services.

#### **Structure**:


#### **Components**:

1. **tools/**: This folder contains the necessary Kubernetes manifests to deploy Jenkins and its components in your AKS cluster. It also includes a `Dockerfile` to build a Jenkins agent image, which is required for running CI/CD pipelines within the Kubernetes environment. You can either build this image from the provided Dockerfile or use a pre-built image. The Jenkins deployment is also configured to automatically provision Kubernetes agents when running Jenkins jobs.

2. **monitoring/**: This folder includes the Kubernetes configurations for deploying **Prometheus** and **Grafana** on your AKS cluster. Prometheus is responsible for collecting metrics from your Kubernetes cluster and services, while Grafana provides dashboards to visualize and monitor the collected metrics. These tools are essential for observing the health and performance of your infrastructure and applications.

#### **To apply the Kubernetes configurations**:

1. Ensure you have access to your AKS cluster using `kubectl`.
2. Deploy the **Jenkins** configuration by applying the manifests in the `tools/` directory:

    ```bash
    kubectl apply -f k8s/tools/
    ```

3. Deploy the **Monitoring Tools** (Prometheus and Grafana) by applying the manifests in the `monitoring/` directory:

    ```bash
    kubectl apply -f k8s/monitoring/
    ```

4. Optionally, if you're using an Ingress to expose these services externally, make sure to apply the relevant Ingress configuration as needed.

#### **Next Steps**:

- After deploying the services, you can access Jenkins, Prometheus, and Grafana via the appropriate exposed IPs or Ingress routes.
- For Jenkins, you'll need to configure Kubernetes credentials and create a pipeline to interact with the cluster.
- For monitoring tools, you can start monitoring the performance and health of your applications using the Grafana dashboards, which will pull data from Prometheus.

---

By following the configurations in this folder, you'll have a fully deployed Kubernetes environment with Jenkins for CI/CD, and Prometheus and Grafana for monitoring and visualization.


### **ansible/**

The **ansible/** folder contains the Ansible configurations and roles necessary for setting up dependencies on your infrastructure. It is designed to automate the installation and configuration of necessary services, particularly in the case where you're using a separate virtual machine for Jenkins or want to install the monitoring tools.

#### **Structure**:



#### **Components**:

1. **roles/**: This directory contains individual roles for setting up various components. Each role includes tasks and handlers for installing and configuring specific services. These roles are modular and can be executed independently or in combination. Here's a breakdown of each role:

   - **base/**: This role contains tasks for setting up the base environment, including updates, package installations, and system configuration that are required across your infrastructure.
   - **docker/**: This role automates the installation of Docker on your hosts, ensuring that the necessary components are installed and configured for running containers.
   - **helm/**: This role installs Helm, a package manager for Kubernetes, which helps in managing Kubernetes applications through Helm charts.
   - **jenkins/**: This role installs and configures Jenkins on the host machine. It also includes configurations for setting up Jenkins to run on Kubernetes, using dynamic agents for job execution.
   - **k8s/**: This role installs and configures Kubernetes tools on the host machine, such as `kubectl` and other utilities needed to interact with your AKS cluster.

2. **inventories/**: This folder contains the Ansible inventory files. The `inventory/` directory includes the hosts file, which defines the different environments and machines that Ansible will target for configuration. In this case, it contains an entry for `[webservers]` (or any other groups you may configure).

3. **ansible.cfg**: This file contains the configuration settings for Ansible, defining options like inventory paths, remote user, and other necessary settings for executing playbooks and roles.

4. **setup.yaml**: This is the main playbook file that ties all roles together. It includes all the necessary roles and ensures that they are applied in the correct order. You can execute this single playbook to set up your entire environment, including Docker, Jenkins, Helm, Kubernetes tools, and more. 

#### **To apply the Ansible setup**:

1. Install Ansible on your local machine, if you haven’t already.
2. Edit the **inventory** file to define your target hosts (e.g., if you have a separate Jenkins VM, add it under `[webservers]`).
3. Run the `setup.yaml` playbook, which will automatically apply all roles:

    ```bash
    ansible-playbook -i inventories/hosts setup.yaml
    ```

#### **Next Steps**:

- Once Ansible has finished running the tasks, your environment will be set up with the necessary services (e.g., Jenkins, Docker, Helm, Kubernetes tools) ready for use.
- You can modify or extend the roles or the `setup.yaml` playbook to suit your specific needs.
  
---

By following the configurations in this folder, you can automate the setup of services like Jenkins, Docker, Helm, and Kubernetes tools, particularly useful when managing a multi-machine setup for your CI/CD pipelines and monitoring tools.


---

> "DevOps: Because even superheroes need to automate their jobs."

Now go ahead, deploy that infrastructure, and embrace the chaos of endless deployments and monitoring. 😄🚀
