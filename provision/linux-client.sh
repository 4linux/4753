#!/bin/bash
BASEDIR="/vagrant/Files/Linux Client"
source /vagrant/provision/vars.sh


#Arquivos:
cp "${BASEDIR}/hosts" /etc/hosts
cp "${BASEDIR}/hostname" /etc/hostname
cp "${BASEDIR}/ifcfg-enp0s3" /etc/sysconfig/network-scripts/ifcfg-enp0s3
cp "${BASEDIR}/98_4linux" /etc/sudoers.d/98_4linux
cp "${BASEDIR}/selinux" /etc/sysconfig/selinux

#Deixar o Firewalld ativado
sudo systemctl enable firewalld

#Function para instalar a GUI no CentOS7
centosGUI;
