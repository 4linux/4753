#! /bin/bash 
for usuarios in $(samba-tool user list | egrep -v "^dns|Administrator|krbtgt|Guest|root"); do
mkdir /srv/samba/lixeiras/$usuarios
chown -R $usuarios /srv/samba/lixeiras/$usuarios
chgrp -R $usuarios /srv/samba/lixeiras/$usuarios
done
