
# lithium + nginx + php-fpm 
# Version 0.1

FROM centos:6.4

MAINTAINER HorizontDimension

# Remi Dependency on CentOS 6 and Red Hat (RHEL) 6 ##
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
 
# CentOS 6 and Red Hat (RHEL) 6 ##
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum --enablerepo=remi,remi-test install nginx php-fpm php-common php-pecl-apc php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongo php-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml supervidor -y




