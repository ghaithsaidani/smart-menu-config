FROM jenkins/inbound-agent:latest


USER root

# I installed prerequisite dependencies
RUN apt-get update && apt-get install -y \
    curl \
    lsb-release \
    gnupg \
    apt-transport-https \
    ca-certificates

# I installed here the azure-cli it is needed in the pipeline
RUN curl -sL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - \
    && echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $(lsb_release -cs) main" > /etc/apt/sources.list.d/azure-cli.list \
    && apt-get update \
    && apt-get install -y azure-cli

# Install helm also needed in pipeline
RUN curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

# kubectl 
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" \
    && install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl


USER jenkins
