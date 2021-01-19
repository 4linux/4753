#!/bin/bash
for usuarios in $(getent passwd | awk -F: ' $3 > 1000 {print $1}' | grep -v nobody); do
samba-tool user create $usuarios 123Mudar --home-drive=H: --script-path=logon.vbs --home-directory=\\\\samba4-server\\$usuarios --profile-path=\\\\samba4-server\\profiles\\$usuarios
done
