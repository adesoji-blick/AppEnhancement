#!/bin/bash

#set ansible user
# echo setting ansible user
# sudo su - ansible

# export environment variables
echo exporting environment variables
# export AWS_ACCESS_KEY_ID='xxxxxxxx'
# export AWS_SECRET_ACCESS_KEY='xxxxxxxx'
export ANSIBLE_HOSTS=ec2.py
export EC2_INI_PATH=ec2.ini

# Prepare Ansible dynamic inventory
echo installing dependencies pip 
ansible-galaxy collection install amazon.aws
wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
python get-pip.py

# Install Boto
echo install boto
# pip install boto3
pip install boto

# permission Mgt
echo setting dynamic inventory permissions
chmod 755 inventory/ec2.py
chmod 755 inventory/ec2.ini