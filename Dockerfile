# Dockerfile for moodle instance. 
# Copied from Jonathan Hardison's docker version. 
#     https://github.com/jmhardison/docker-moodle

FROM ubuntu:16.04
MAINTAINER KQMATH project, Hans Georg Schaathun <georg+github@schaathun.net>

VOLUME ["/var/moodledata"]
EXPOSE 80 443

COPY moodle-config.php /var/www/html/config.php
ADD ./foreground.sh /etc/apache2/foreground.sh

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Database info
#Change to your ip
ENV MYSQL_HOST localhost
ENV MYSQL_USER moodle
ENV MYSQL_PASSWORD moodle
ENV MYSQL_DB moodle
#Change to your ip
ENV MOODLE_URL http://localhost:8088

RUN apt-get update && \
        apt-get -y install \
            mysql-client pwgen python-setuptools curl git unzip apache2 php \
            php-gd libapache2-mod-php postfix wget supervisor php-pgsql curl \
	    libcurl3 libcurl3-dev php-curl php-xmlrpc php-intl php-mysql \
	    git-core php-xml php-mbstring php-zip php-soap && \
        cd /tmp && \
        #change if you want another version of moodle
        git clone -b MOODLE_32_STABLE git://git.moodle.org/moodle.git \
	    --depth=1 && \
        mv /tmp/moodle/* /var/www/html/ && \
        rm /var/www/html/index.html && \
        chown -R www-data:www-data /var/www/html && \
        chmod +x /etc/apache2/foreground.sh

# Enable SSL, moodle requires it
RUN a2enmod ssl && \
    a2ensite default-ssl 
# if using proxy, don't need actually secure connection

# Cleanup
RUN apt-get clean autoclean && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /tmp/* /var/tmp/* /var/lib/dpkg/* /var/lib/cache/* /var/lib/log/*

CMD ["/etc/apache2/foreground.sh"]

