#!/bin/bash

#importando as variaveis
BASEDIR="/vagrant/Files/Security"
source /vagrant/provision/vars.sh

#Function para criar e alterar as senhas dos usuários
usersADD;


#Arquivos:
cp "${BASEDIR}/hosts" /etc/hosts
cp "${BASEDIR}/hostname" /etc/hostname
cp "${BASEDIR}/interfaces" /etc/network/interfaces
cp "${BASEDIR}/98_4linux" /etc/sudoers.d/98_4linux
cp "${BASEDIR}/rc.local" /etc/rc.local
cp "${BASEDIR}/dhcpd.conf" /opt/dhcpd.conf
