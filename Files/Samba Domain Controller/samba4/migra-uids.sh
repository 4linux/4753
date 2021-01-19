#!/bin/bash
### Cria ou limpa o arquivo ldif temporário
> /tmp/modifica.ldif
### Define variável com a lista de todos os usuários do AD
for usuarios in $(samba-tool user list | egrep -v "^dns|Administrator|krbtgt|Guest|root") ; do
### Define variável com os SIDS de todos os usuarios do AD
sid=$(wbinfo -n $usuarios | cut -d ' ' -f1)
#### Converte SID para UID dos usuários do AD
wbinfo -S $sid >> /dev/null
### Define variável com a lista de UID Unix dos usuários do sistema
uid=$(getent passwd $usuarios | cut -d: -f3)
### Cria o arquivo ldif temporário para a migração de SID para UID
echo "dn: CN=$sid" >> /tmp/modifica.ldif
echo "changetype: modify" >> /tmp/modifica.ldif
echo "replace: xidNumber" >> /tmp/modifica.ldif
echo "xidNumber: $uid" >> /tmp/modifica.ldif
echo "" >> /tmp/modifica.ldif
### Comando que modifica o mapa de UIDS através do arquivo .ldif
ldbmodify -H /var/lib/samba/private/idmap.ldb /tmp/modifica.ldif 
done
