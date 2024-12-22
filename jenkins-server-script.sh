#!/bin/bash

# install jenkins
sudo wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
sudo yum upgrade -y
# Add required dependencies for the jenkins package
sudo amazon-linux-extras enable corretto
sudo yum install java-17-amazon-corretto -y
sudo yum install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl restart jenkins
sudo systemctl status jenkins


# install git
sudo yum install git -y

# install terraform
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/AmazonLinux/hashicorp.repo
sudo yum -y install terraform


# install kubectl
# curl -LO https://dl.k8s.io/release/v1.31.0/bin/linux/amd64/kubectl
# curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
# sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
# sudo chmod +x kubectl
# sudo mkdir -p ~/.local/bin 
# sudo mv ./kubectl ~/.local/bin/kubectl

sudo curl -LO https://storage.googleapis.com/kubernetes-release/release/v1.23.6/bin/linux/amd64/kubectl
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
sudo chmod +x ./kubectl
sudo mkdir -p $HOME/bin && sudo cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
kubectl version --client





# Add Docker's official GPG key:
sudo yum update -y
sudo amazon-linux-extras install  -y
sudo yum install -y docker
sudo usermod -a -G docker ec2-user
sudo systemctl start docker
sudo systemctl enable 
sudo usermod -aG docker jenkins
sudo systemctl restart jenkins


# Add Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose