# Dockerfile for moodle instance. 
# Copied from Jonathan Hardison's docker version. 
#     https://github.com/jmhardison/docker-moodle

FROM kqm/apache
MAINTAINER KQMATH project, Hans Georg Schaathun <georg+github@schaathun.net>

VOLUME ["/var/moodledata"]
EXPOSE 80 443

RUN chown www-data.www-data /var/moodledata && \
    chmod 2775 /var/moodledata

ADD ./install.sh /etc/install.sh
ADD maxima_5.40.0-1_amd64.deb /tmp/maxima.deb


# The setup is assuming development on localhost.
# For deployment, you need to change localhost to the IP you use.
# This can be done here, or on the command line starting the container.
ENV MYSQL_HOST localhost
ENV MOODLE_URL http://localhost:8088

# Database info
ENV MYSQL_USER moodle
ENV MYSQL_PASSWORD moodle
ENV MYSQL_DB moodle

RUN apt-get update && \
    apt-get -y install sbcl gnuplot texinfo && \
    dpkg -i /tmp/maxima.deb && \
    useradd test && \
    chmod +x /etc/install.sh && \
    rm -rf /tmp/* /var/tmp/* /var/lib/log/*

CMD ["/etc/apache2/foreground.sh"]

