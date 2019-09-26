# vim:set ft=dockerfile:

FROM centos:latest

MAINTAINER wluisaraujo
LABEL maintainer="wluisaraujo"

RUN yum install -y epel-release
RUN yum makecache
RUN yum -y install nginx

EXPOSE 80/tcp 80/udp
EXPOSE 443/tcp 443/udp
