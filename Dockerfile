FROM centos:latest
MAINTAINER vikram.vsinghads@gmail.com
RUN cd /etc/yum.repos.d/
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum -y install java

CMD /bin/bash
RUN yum install -y httpd \
  zip \
 unzip 
ADD https://files.all-free-download.com/downloadfiles/graphic/graphic_7/blue_flame_6891264.zip /var/www/html/
WORKDIR /var/www/html
RUN unzip blue_flame_6891264.zip
RUN cp -rvf blue_flame_6891264/* .
RUN rm -rf blue_flame_6891264 blue_flame_6891264.zip
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80  
