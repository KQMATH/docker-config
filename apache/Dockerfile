# Dockerfile for an apache server instance. 
# Copied from Jonathan Hardison's docker version. 
#     https://github.com/jmhardison/docker-moodle

FROM ubuntu:17.04
MAINTAINER KQMATH project, Hans Georg Schaathun <georg+github@schaathun.net>

VOLUME ["/var/www/html"]
EXPOSE 80 443

ADD ./foreground.sh /etc/apache2/foreground.sh

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
        apt-get -y install apt-utils && \
        apt-get -y install \
            mysql-client pwgen python-setuptools unzip apache2 php \
            php-gd libapache2-mod-php postfix wget supervisor php-pgsql curl \
	    libcurl3 libcurl3-dev php-curl php-xmlrpc php-intl php-mysql \
	    git-core php-xml php-mbstring php-zip php-soap vim && \
        chmod +x /etc/apache2/foreground.sh

# Enable SSL, moodle requires it
RUN a2enmod ssl && \
    a2ensite default-ssl 
# if using proxy, don't need actually secure connection

# Cleanup
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/* /var/lib/cache/* /var/lib/log/*

CMD ["/etc/apache2/foreground.sh"]

