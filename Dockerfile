
# lithium + nginx + php-fpm 
# Version 0.1

FROM centos:6.4

MAINTAINER HorizontDimension

# Remi Dependency on CentOS 6 and Red Hat (RHEL) 6 ##
RUN rpm -Uvh http://download.fedoraproject.org/pub/epel/6/i386/epel-release-6-8.noarch.rpm
 
# CentOS 6 and Red Hat (RHEL) 6 ##
RUN rpm -Uvh http://rpms.famillecollet.com/enterprise/remi-release-6.rpm

ADD nginx.repo /etc/yum.repos.d/nginx.repo

RUN echo "root:123456" | chpasswd

RUN yum --enablerepo=remi,remi-test install nginx php-fpm php-common php-pecl-apc php-cli php-pear php-pdo php-mysqlnd php-pgsql php-pecl-mongo php-sqlite php-pecl-memcache php-pecl-memcached php-gd php-mbstring php-mcrypt php-xml supervidor openssh-server -y

RUN sed -i 's/UsePAM yes/UsePAM no/g' /etc/ssh/sshd_config

RUN mkdir -p /var/www/spreent.eu && mkdir -p /var/www/spreent.eu/logs && chown -R apache:apache /var/www/spreent.eu && mkdir /etc/nginx/sites-available && mkdir /etc/nginx/sites-enabled
RUN mkdir -p /var/www/admin.spreent.eu && mkdir -p /var/www/admin.spreent.eu/logs && chown -R apache:apache /var/www/admin.spreent.eu

ADD spreent.eu.conf /etc/nginx/sites-available/spreent.eu.conf
ADD admin.spreent.eu.conf /etc/nginx/sites-available/admin.spreent.eu.conf
ADD start.sh /start.sh
ADD fpm.conf /etc/php-fpm.d/fpm.conf

RUN ln -s /etc/nginx/sites-available/spreent.eu.conf /etc/nginx/sites-enabled/spreent.eu.conf
RUN ln -s /etc/nginx/sites-available/admin.spreent.eu.conf /etc/nginx/sites-enabled/admin.spreent.eu.conf


RUN git clone git://github.com/UnionOfRAD/framework.git /var/www/spreent.eu/public_html  
RUN cd /var/www/spreent.eu/public_html && git submodule init && git submodule update
RUN chmod 777 /var/www/spreent.eu/public_html/app/resources/

RUN git clone git://github.com/UnionOfRAD/framework.git /var/www/admin.spreent.eu/public_html  
RUN cd /var/www/admin.spreent.eu/public_html && git submodule init && git submodule update
RUN chmod 777 /var/www/admin.spreent.eu/public_html/app/resources/

CMD ["/start.sh"]












