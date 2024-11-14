# Kubernetes Manifests Setup for Monitoring and Tools

This repository contains Kubernetes manifests for setting up monitoring tools (Prometheus and Grafana) and tools like Jenkins for CI/CD pipelines on a Kubernetes cluster.

## Prerequisites

Before applying the manifests, ensure you have the following:

- Azure CLI installed and configured on your local machine.
- Kubernetes cluster (Azure AKS in this case).
- kubectl installed and configured to access your Kubernetes cluster.

## Steps to Setup

### 1. Import the Cluster to Your Local Host

To import the Azure Kubernetes Service (AKS) cluster to your local host, run the following command:

```bash
az aks get-credentials --resource-group <resource-group-name> --name <aks-name>
```

### 2. Setup NGINX Ingress on the Cluster

To import the Azure Kubernetes Service (AKS) cluster to your local host, run the following command:

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.0-beta.0/deploy/static/provider/cloud/deploy.yaml
```

### 3. Update Ingress Manifests with NGINX Public IP

Once the NGINX ingress controller is deployed, you need to copy the exposed public IP address of the NGINX ingress LoadBalancer service.

You can retrieve the public IP with the following command:

```bash
kubectl get svc -o wide -w -n ingress-nginx
```

After obtaining the public IP, update the NGINX ingress manifests in the `monitoring/` and `tools/` folders. Replace the EXTERNAL-IP placeholder in the ingress configurations with this IP address.

### 4. Apply Monitoring Manifests

To deploy Prometheus and Grafana along with the ingress for monitoring, apply the configurations in the `monitoring/` folder:

```bash
kubectl apply -f monitoring/
```

### 5. Apply Tools Manifests

To deploy Jenkins along with the Docker agent used for the pipelines, apply the configurations in the `tools/` folder:

```bash
kubectl apply -f tools/
```

### 6. Configure Jenkins

1. **Install Jenkins Plugins**:
   - Open Jenkins and install the following extensions:
     - **Kubernetes** plugin
     - **Azure Credentials** plugin

2. **Create a Kubernetes Cloud in Jenkins**:
   - Go to *Manage Jenkins* → *Configure System*.
   - Scroll to the *Cloud* section and click *Add Kubernetes*.
   - Follow the instructions from [DevOpsCube](https://devopscube.com/jenkins-build-agents-kubernetes/) to configure Jenkins to use Kubernetes.

3. **Pod Template**:
   - For the **Pod Template**, use the image `ghaithsaidani/jenkinsagent:latest`. Alternatively, you can build and push your own agent image from the `Dockerfile` located in the `tools/agent/` folder.

4. **Add Azure Tenant Credentials**:
   - In Jenkins, add two credentials:
     - **GitHub Credential**: Add your GitHub token.
     - **Azure Tenant Credential**: Follow steps to create an Azure Tenant credential.

### 7. Create Azure Tenant Credentials

In Jenkins, you need to add two credentials:

1. **GitHub Credential**:
   - In Jenkins, go to *Manage Jenkins* → *Manage Credentials*.
   - Click on **(global)** → **Add Credentials**.
   - Choose **Secret text** and enter your **GitHub token**.

2. **Azure Tenant Credential**:
   - Follow steps to create an **Azure Tenant Credential** in Jenkins:
     - Go to *Manage Jenkins* → *Manage Credentials*.
     - Select **(global)** → **Add Credentials**.
     - Choose **Username and Password** and provide your Azure Tenant credentials (username and password or client secret).

   You can find more detailed instructions on creating Azure credentials [here](https://docs.microsoft.com/en-us/azure/azure-resource-manager/management/azure-subscription-service-principal).

### 8. Create and Run a Jenkins Pipeline

After setting up Jenkins with the Kubernetes agent and credentials, follow these steps to create and run a Jenkins pipeline that references your GitHub repository containing the `Jenkinsfile`:

1. **Create a New Pipeline**:
   - In Jenkins, click on *New Item*.
   - Choose **Pipeline** and provide a name for your pipeline.
   - Click **OK** to create the pipeline.

2. **Configure Pipeline**:
   - In the pipeline configuration, scroll down to the *Pipeline* section.
   - Under the *Definition* field, choose **Pipeline from SCM**.
   - In the *SCM* field, choose **Git**.
   - In the *Repository URL* field, enter the URL of your GitHub repository that contains the `Jenkinsfile`.
     - Example: `https://github.com/your-username/your-repo.git`
   - Under the *Credentials* field, select the GitHub credentials you added earlier.

3. **Specify Branch and Jenkinsfile Path**:
   - In the *Branch Specifier* field, enter the branch you want Jenkins to use (e.g., `main` or `master`).
   - In the *Script Path* field, specify the path to your `Jenkinsfile` (usually it's just `Jenkinsfile` if it’s in the root of your repo).

4. **Run the Pipeline**:
   - Once the pipeline is configured, click **Save**.
   - To trigger the pipeline, click **Build Now**.
   - Jenkins will now pull the repository, read the `Jenkinsfile`, and execute the pipeline.

Now you're ready to run your pipeline and start automating your CI/CD process with your GitHub repository!

---

Enjoy your setup and consider yourself a DevOps engineer! 😄 `Just Kidding`



