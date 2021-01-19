#!/bin/bash
for grupos in $(getent group | awk -F: ' $3 > 100 {print $1}' | egrep 'ti|vendas|logistica|financeiro'); do
samba-tool group add $grupos
done
