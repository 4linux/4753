#!/bin/bash
for usuarios in $(samba-tool user list | egrep -v "^dns|Administrator|krbtgt|Guest|root"); do
samba-tool user setpassword $usuarios --newpassword=4Linuxsamba --must-change-at-next-login
done
