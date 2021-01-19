#!/bin/bash

#importando as variáveis
source /vagrant/provision/vars.sh
BASEDIR="/vagrant/Files/Docker Workstation"


#Function para criar e alterar as senhas dos usuários
usersADD;

cp "${BASEDIR}/hosts" /etc/hosts
cp "${BASEDIR}/hostname" /etc/hostname
cp "${BASEDIR}/interfaces" /etc/network/interfaces
cp "${BASEDIR}/98_4linux" /etc/sudoers.d/98_4linux
cp "${BASEDIR}/docker-compose.yaml" /opt/docker-compose.yaml
