# Dockerfile for moodle instance. 
# Copied from Jonathan Hardison's docker version. 
#     https://github.com/jmhardison/docker-moodle

FROM kqm/apache
MAINTAINER KQMATH project, Hans Georg Schaathun <georg+github@schaathun.net>

VOLUME ["/var/moodledata"]
EXPOSE 80 443

ADD ./install.sh /etc/install.sh

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
    apt-get -y install maxima gnuplot maxima-share texinfo && \
    useradd test && \
    chmod +x /etc/install.sh && \
    rm -rf /tmp/* /var/tmp/* /var/lib/log/*

CMD ["/etc/apache2/foreground.sh"]

