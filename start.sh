#!/bin/bash
ip addr add dev eth0 178.32.93.159/32
service sshd restart
service nginx restart
service php-fpm restart
tail -f /dev/null
