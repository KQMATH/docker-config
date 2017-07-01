# Dockerfile for an apache server instance. 
# Copied from Jonathan Hardison's docker version. 
#     https://github.com/jmhardison/docker-moodle

FROM ubuntu:17.04
MAINTAINER KQMATH project, Hans Georg Schaathun <georg+github@schaathun.net>

VOLUME ["/src"]

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
        apt-get -y install apt-utils && \
        apt-get -y install \
            git-core wget curl \
	    libcurl3 libcurl3-dev \
	    sbcl python vim  \
	    build-essential checkinstall

CMD /bin/bash

