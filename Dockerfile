FROM centos
MAINTAINER Naomy Andrade Crespo <nandrade@ilg.cat>
LABEL Vendor="CentOS"
LABEL License=GPLv2

RUN rpm -Uvh --replacepkgs https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm

RUN yum -y update && yum clean all && \
yum -y install httpd && \yum -y install net-tools && yum clean all

RUN yum install -y php56w php56w-opcache php56w-mysql php56w-iconv php56w-mbstring php56w-curl php56w-openssl php56w-tokenizer php56w-soap php56w-ctype php56w-zip php56w-gd php56w-simplexml php56w-spl php56w-pcre php56w-dom php56w-xml php56w-intl php56w-json php56w-ldap php56w-pecl-apcu php56w-odbc php56w-pear php56w-xmlrpc php56w-snmp php56w-pdo curl

RUN echo '<?php phpinfo(); ?>' > /var/www/html/index.php

EXPOSE 80
CMD ["/usr/sbin/apachectl","-DFOREGROUND"]
