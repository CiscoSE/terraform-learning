FROM ubuntu:latest

ARG DEBIAN_FRONTEND=noninteractive

RUN <<EOF
# Patch up Ubuntu
apt-get update
apt-get upgrade -y

# Required components
apt-get install gpg wget lsb-release -y

# Add elements I like for for coding in containers
apt-get install vim git net-tools zsh -y

# Terraform Install
wget -O - https://apt.releases.hashicorp.com/gpg | gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/hashicorp.list
apt update
apt install terraform -y
EOF
