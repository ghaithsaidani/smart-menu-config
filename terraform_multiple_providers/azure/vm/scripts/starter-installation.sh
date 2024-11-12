#! /bin/bash

#update system
sudo apt update | sudo apt upgrade -y

#install curl
sudo apt install -y curl


#install node js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

sudo apt install -y nodejs

#install open-jdk
sudo apt install -y openjdk-17-jdk


#install git and connect account
sudo apt install -y git

git config --global user.name "ghaithsaidani"
git config --global user.email "ghaith.saidani@sesame.com.tn"
git config --global credential.helper store


#install jenkins
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update
sudo apt-get install -y jenkins

#install docker
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

#install docker compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# add access to github account and clone repos
#sed -i 's/\r$//' /tmp/.env

#source /tmp/.env

#git clone https://$GITHUB_USER:$GITHUB_PAT@github.com/$GITHUB_USER/smart-menu-backend.git

# Add Jenkins user to sudoers with NOPASSWD for Docker and Docker Compose
sudo usermod -aG docker jenkins

sudo systemctl restart jenkins | sudo systemctl restart docker

sudo sh -c "echo 'jenkins ALL=(ALL) NOPASSWD: /usr/bin/docker, /usr/local/bin/docker-compose' >> /etc/sudoers.d/jenkins"
sudo chmod 440 /etc/sudoers.d/jenkins




#chmod 600 /home/ghaith/.ssh/id_rsa_github
#chmod 644 /home/ghaith/.ssh/id_rsa_github.pub

#eval "$(ssh-agent -s)"


#ssh-add /home/ghaith/.ssh/id_rsa_github

