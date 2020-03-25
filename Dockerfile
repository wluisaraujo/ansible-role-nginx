# vim:set ft=dockerfile:

FROM centos:7

MAINTAINER wluisaraujo
LABEL maintainer="wluisaraujo"

ENV NGINX_VERSION 1.17.9

ENV CONFIG "\
--user=nginx
--group=nginx \
--prefix=/etc/nginx \
--conf-path=/etc/nginx/nginx.conf \
--http-client-body-temp-path=/var/cache/nginx/client_temp \
--http-fastcgi-temp-path=/var/cache/nginx/fastcgi_temp \
--http-proxy-temp-path=/var/cache/nginx/proxy_temp \
--http-scgi-temp-path=/var/cache/nginx/scgi_temp \
--http-uwsgi-temp-path=/var/cache/nginx/uwsgi_temp \
--sbin-path=/usr/sbin/nginx \
--conf-path=/etc/nginx/nginx.conf \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--error-log-path=/var/log/nginx/error.log \
--http-log-path=/var/log/nginx/access.log \
--with-http_gzip_static_module \
--with-http_stub_status_module \
--with-http_ssl_module \
--with-pcre --with-file-aio \
--with-http_realip_module \
--add-module=/usr/src/nginx-auth-ldap \
--with-debug \
"

RUN useradd -r -U -c "Nginx web server" -d /var/lib/nginx -s /sbin/nologin nginx

RUN echo -e 'root soft  nofile 65535
root hard  nofile 65535' | tee -a /etc/security/limits.conf

RUN yum install -y epel-release
RUN yum makecache
RUN yum -y upgrade && \
yum -y install \
curl \
@Development Tools \
git \
curl \
wget \
openssl-devel \
pcre-devel \
openldap-devel.x86_64
lsof \
telnet

RUN yum clean all ; rm -rf /var/cache/yum/* 2> /dev/null

RUN git clone https://github.com/kvspb/nginx-auth-ldap.git /usr/src/nginx-auth-ldap

RUN curl -fSL http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -o nginx.tar.gz -o /tmp/nginx.tar.gz \
&& tar -zxf /tmp/nginx.tar.gz -C /usr/src/ \
&& cd /usr/src/nginx-$NGINX_VERSION \
&& ./configure $CONFIG \
&& make && make install

RUN echo -e '[Unit]
Description=The nginx HTTP and reverse proxy server
After=syslog.target network.target remote-fs.target nss-lookup.target

[Service]
Type=forking
EnvironmentFile=/etc/sysconfig/nginx
PIDFile=/var/run/nginx.pid
ExecStartPre=/usr/sbin/nginx -t
ExecStart=/usr/sbin/nginx $CLI_OPTIONS
ExecReload=/usr/sbin/nginx -s reload
ExecStop=/usr/sbin/nginx -s quit
PrivateTmp=true

[Install]
WantedBy=multi-user.target' > /etc/systemd/system/nginx.service

RUN echo -e '# Command line options to use when starting nginx
CLI_OPTIONS="" ' > /etc/sysconfig/nginx

RUN systemctl daemon-reload
RUN systemctl enable nginx
RUN systemctl restart nginx
