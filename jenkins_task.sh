#!/bin/bash

#set jenkins user
# echo setting jenkins user
# sudo su - jenkins

# export environment variables
echo ----- exporting environment variables -----
export ANSIBLE_HOSTS=ec2.py
export EC2_INI_PATH=ec2.ini

# permission Mgt
echo ----- setting dynamic inventory permissions -----
chmod 755 ec2.py
chmod 755 ec2.ini