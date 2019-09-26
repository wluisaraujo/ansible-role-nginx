# vim:set ft=dockerfile:

FROM debian:latest

MAINTAINER wluisaraujo
LABEL maintainer="wluisaraujo"

RUN yum makecache fast
RUN yum install -y epel-release
RUN yum --enable=epel -y install nginx 

#VOLUME [ "/path", "/path1" ]
#CMD service slapd start

EXPOSE 80/tcp 80/udp
EXPOSE 443/tcp 443/udp
