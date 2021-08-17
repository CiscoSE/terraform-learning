FROM ubuntu:latest

# Patch up Ubuntu
RUN apt update && apt upgrade -y && \
	apt install curl gnupg2 software-properties-common -y

# Install Terraform
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
	apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	apt-get install terraform -y

# Things I like to have on a system, but you may not need or want.
RUN apt install vim git screen
