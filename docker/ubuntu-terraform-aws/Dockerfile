FROM ubuntu:latest

# Patch up Ubuntu
RUN apt update && apt upgrade -y && \
	apt install curl gnupg2 software-properties-common zip -y

# Install Terraform from reporsitory
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - && \
	apt-add-repository "deb [arch=$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main" && \
	apt-get install terraform -y

# Install AWS CLI
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
	unzip awscliv2.zip && \
	./aws/install

# Things I like to have on a system, but you may not need or want.
RUN apt install vim git screen
