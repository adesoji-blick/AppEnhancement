#!/bin/bash

#set jenkins user
# echo setting jenkins user
# sudo su - jenkins

# export environment variables
echo ----- exporting environment variables -----
export ANSIBLE_HOSTS=ec2.py
export EC2_INI_PATH=ec2.ini
export dockerpassword=
# export PIP_PATH="/home/jenkins/.local/bin"
# export WHEEL_PATH="/home/jenkins/.local/bin"

# permission Mgt
echo ----- setting dynamic inventory permissions -----
chmod 755 ec2.py
chmod 755 ec2.ini