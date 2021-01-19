#!/bin/bash

USER='suporte'
PASS='4linux'



function centosGUI {
  #GUI install on CentOS7
  sudo yum groupinstall -y 'gnome desktop'
  sudo yum install -y 'xorg*'
  sudo yum remove -y initial-setup initial-setup-gui
  sudo systemctl isolate graphical.target
  systemctl set-default graphical.target   # to make this persistant

  vagrant halt ; vagrant up
}



function usersADD {
  #criando o usuário suporte
  useradd -m -d "/home/${USER}" -p $(openssl passwd -1 ${PASS}) -s /bin/bash ${USER}
  #alterando a  senha do usuario vagrant
  sudo usermod -p $(openssl passwd -1 ${PASS}) vagrant

  #alterando a  senha do root
  sudo usermod -p $(openssl passwd -1 ${PASS}) root
}
