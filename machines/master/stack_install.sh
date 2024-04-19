#!/bin/bash

sudo apt update
sudo apt install -y python3 git
sudo curl -sS https://bootstrap.pypa.io/pip/3.6/get-pip.py | sudo python3
sudo /usr/local/bin/pip3 install ansible
sudo apt install -y sshpass
sudo apt install -y zsh git

for ip in aws_instance.node[*].private_ip ; do
    echo -e "worker  ansible_host=${ip}  ansible_user=adminuser  ansible_password=Formation1234  ansible_python_interpreter=/usr/bin/python3 ansible_ssh_common_args='-o StrictHostKeyChecking=no'" >> /home/adminuser/hosts.ini
done
