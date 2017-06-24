#!/bin/bash

set -e

echo "Checking for EPEL repository"
num=`yum repolist | grep "Extra Packages" | wc -l`
if [ $num -eq 0 ]
then
    yum -y install wget ;
    wget  http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm ;
    rpm -ivh epel-release-7-9.noarch.rpm ;
fi

echo "Checking for Ansible"
numansible=`yum list installed | grep ansible | wc -l`
if [ $numansible -eq 0 ]
then
    echo "Installing ansible"
    yum -y install ansible
fi
cp /vagrant/ansible/ansible.cfg /etc/ansible/ansible.cfg





