#!/bin/bash

exec > "audit.log"

uptime
echo "-----------------------------------------------"
w
echo "-----------------------------------------------"
last
echo "-----------------------------------------------"
ps -eo comm,pcpu,pmem --sort -pcpu,-pmem | head
echo "-----------------------------------------------"
netstat -tulpn | grep LISTEN
echo "-----------------------------------------------"
cat /etc/sysctl.conf

