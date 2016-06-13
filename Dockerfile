FROM centos 
MAINTAINER Bestony<best.tony@foxmail.com>
WORKDIR /
RUN yum -y update && yum -y install wget make automake gcc gcc-c++ pcre-devel zlib-devel sqlite-devel openssl-devel
RUN yum -y install python-setuptools && easy_install supervisor
RUN mkdir -p /var/log/supervisord
RUN wget http://download.kanglesoft.com/zcore.php?os=src && tar -zxvf  zcore.php?os=src 
WORKDIR /kangle-3.4.8
RUN ./configure --prefix=/vhs/kangle --enable-disk-cache --enable-ipv6 --enable-ssl --enable-vh-limit 
RUN make && make install
COPY supervisord.conf /etc/supervisor/supervisord.conf
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]
