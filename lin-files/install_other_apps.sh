#!/bin/bash
set -x

# Install Git, ansible unzip
sudo apt-get update
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y git ansible unzip


# Installing bash-it
git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
echo "y" |~/.bash_it/install.sh


sudo apt -y install python-pip

# install awscli and ebcli
sudo apt -y install awscli

TERRAFORM_VERSION="0.12.24"
PACKER_VERSION="1.5.4"

#terraform
T_VERSION=$(/usr/local/bin/terraform -v | head -1 | cut -d ' ' -f 2 | tail -c +2)
T_RETVAL=${PIPESTATUS[0]}

[[ $T_VERSION != $TERRAFORM_VERSION ]] || [[ $T_RETVAL != 0 ]] \
&& wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
&& sudo unzip -o terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# packer
P_VERSION=$(/usr/local/bin/packer -v)
P_RETVAL=$?

[[ $P_VERSION != $PACKER_VERSION ]] || [[ $P_RETVAL != 1 ]] \
&& wget -q https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip \
&& sudo unzip -o packer_${PACKER_VERSION}_linux_amd64.zip -d /usr/local/bin \
&& rm packer_${PACKER_VERSION}_linux_amd64.zip


# Install AliCloud Cli

wget -q "https://aliyuncli.alicdn.com/aliyun-cli-linux-3.0.2-amd64.tgz" \
&& gunzip aliyun-cli-linux-3.0.2-amd64.tgz \
&& tar xf aliyun-cli-linux-3.0.2-amd64.tar \
&& sudo mv aliyun /usr/local/bin \
&& sudo rm aliyun-cli*

