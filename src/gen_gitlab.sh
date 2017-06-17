 #!/usr/bin/env bash
#-------------------------------------
# Filename gen_gitlab.sh
# Revision 1.0
# Data 2017/06/27
# Des Install gitlab
# author: pairs
# email:736418319@qq.com
# env: ubuntu
#-------------------------------------

## 1. install and configure the necessary dependencies
sudo apt-get install curl openssh-server ca-certificates postfix || exit 1

## 2. Add the GitLab package server and install the package

curl -sS https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash || exit 2

sudo apt-get install gitlab-ce

## 3. Configure and start GitLab
sudo gitlab-ctl reconfigure

## 4. Browse to the hostname and login

echo "Install gitlab success, enjoy!!!!!!!!"

