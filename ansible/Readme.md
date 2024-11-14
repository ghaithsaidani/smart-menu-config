# Ansible Configuration for DevOps Setup

This Ansible project is designed to automate the setup of various DevOps tools and configurations. The project is structured into multiple roles to handle specific tasks, including setting up Docker, Helm, Jenkins, and Kubernetes (K8s). Additionally, the project includes an `inventories` folder to specify configurations for different environments.

## Project Structure

The project is organized as follows:

- **Roles**: Each role (base, docker, helm, jenkins, k8s) now includes a **tasks** and **handlers** folder.
- **Handlers**: They are explained to trigger specific actions based on the tasks.
- **Inventories**: Instructions for configuring the `inventories/host` file to handle target hosts, including separate Jenkins VMs.
- **Playbook**: An example of how to combine these roles into a playbook for execution.

This structure and explanation will guide you through using and customizing this Ansible configuration effectively. Let me know if you need further modifications!

### Roles

Each role is designed to perform specific tasks and configurations on the target host(s).

1. **base**:
   - This role contains the basic setup tasks for the system.
   - Tasks include installing essential packages, configuring basic system settings, and ensuring the host is ready for other roles.

2. **docker**:
   - This role handles the installation and configuration of Docker.
   - Tasks include installing Docker, starting the Docker service, and verifying the installation.

3. **helm**:
   - This role manages the installation of Helm, the Kubernetes package manager.
   - Tasks include installing Helm and configuring it to work with a Kubernetes cluster.

4. **jenkins**:
   - This role is used for setting up Jenkins on the target host.
   - Tasks include installing Jenkins, configuring Jenkins to run as a service, and setting up necessary plugins.
   - A special note: If you're using a separate virtual machine for Jenkins, ensure that the `inventories/host` file is configured accordingly.

5. **k8s**:
   - This role is used to configure and manage Kubernetes.
   - Tasks include installing Kubernetes, configuring kubelet, setting up `kubectl`, and ensuring Kubernetes components are running.

### Handlers

Handlers are used to perform actions in response to task changes (e.g., restarting services after configuration changes). Each role contains its own handlers to manage tasks like restarting services or applying configurations only when necessary.

For example:
- In the **docker** role, a handler will be used to restart Docker if configuration changes are made.
- In the **jenkins** role, a handler will restart Jenkins if its configuration is modified.

Handlers are defined within each role and executed automatically when the corresponding tasks are triggered.

### Inventories

The `inventories` folder contains configuration files for specifying the target hosts. These configurations allow you to define different environments, for example:

- **host**: This file defines the target hosts for the Ansible playbook execution. If you're using a separate virtual machine for Jenkins, ensure the host file points to the appropriate machine.

Here’s an example of how your `inventories/host` file might look:

```ini
[webservers]
host IP address
```


### **ansible.cfg**

The `ansible.cfg` file is the central configuration file for Ansible. It provides default settings for how Ansible runs, such as the location of inventories, roles, and other global settings. Here is an example configuration:

```ini
[defaults]
inventory = inventories/host
private_key_file = /path/to/your/private/key
remote_user = your-username
```


🚀  **Start you playbook by running this command**

```bash
ansible-playbook -i setup.yaml
```