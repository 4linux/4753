#!/bin/bash

#importando as variaveis
BASEDIR="/vagrant/Files/IPA Server"
source /vagrant/provision/vars.sh

#Function para criar e alterar as senhas dos usuários
usersADD;

#Arquivos:
cp "${BASEDIR}/hosts" /etc/hosts
cp "${BASEDIR}/hostname" /etc/hostname
cp "${BASEDIR}/ifcfg-enp0s3" /etc/sysconfig/network-scripts/ifcfg-enp0s3
cp "${BASEDIR}/98_4linux" /etc/sudoers.d/98_4linux
cp "${BASEDIR}/selinux" /etc/sysconfig/selinux
cp "${BASEDIR}/smb.conf" /opt/smb.conf



#Deixar o Firewalld ativado
sudo systemctl enable firewalld

#Function para instalar a interface gráfica
centosGUI;
