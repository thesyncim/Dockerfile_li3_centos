#!/bin/bash
service sshd restart
service nginx restart
service php-fpm restart
tail -f /dev/null
