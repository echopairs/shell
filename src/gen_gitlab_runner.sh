#!/bin/bash
#-------------------------------------
# Filename gen_gitlab_runner.sh 
# Revision 1.0
# Data 2017/6/27
# Des geb gitlab runner
# author: pairs
# email:736418319@qq.com
# env: ubuntu/centos
#-------------------------------------

UBUNTU_FLAG=`cat /etc/issue | grep -i ubuntu >/dev/null 2>&1 && echo true || echo false`
CENTOS_FLAG=`cat /etc/issue | grep -i centos >/dev/null 2>&1 && echo true || echo false`

# 1. init the Runner && gitlab-ci-multi-runner
if [ "$UBUNTU_FLAG"X = "true"X ]; then
    echo "-- this is ubuntu system"
    echo "--begin install runner"
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.deb.sh | sudo bash || { echo " build runner failed"; exit 1; }
    sudo apt-get install gitlab-ci-multi-runner || { echo " build gitlab-ci-multi-runner failed"; exit 2; }

else if [ "$CENTOS_FLAG"x = "true"x ];then
    echo "-- this is centos system"
    echo "--begin install runner"
    curl -L https://packages.gitlab.com/install/repositories/runner/gitlab-ci-multi-runner/script.rpm.sh | sudo bash || { echo " build runner failed"; exit 1; }
    sudo yum install gitlab-ci-multi-runner || { echo " build gitlab-ci-multi-runner failed"; exit 2; }
else
    echo "-- not supports system except centos and ubuntu"
fi
fi

# 2. register runner
#    2.1. Enter GitLab instance URL
#    2.2. Enter GitLab project token
#    2.3. Enter Runner description
#    2.4. Enter the tags associated with the Runner(not need now)
#    2.5. Enter Runner executor type


sudo gitlab-runner register

