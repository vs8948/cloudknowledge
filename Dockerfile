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
ADD https://www.phptpoint.com/getprojectfile/46 /var/www/html/
WORKDIR /var/www/html
RUN unzip *1629435806.zip
RUN cp -rvf 1629435806/* .
RUN rm -rf photogenic photogenic.zip 
CMD ["/usr/sbin/httpd", "-D",  "FOREGROUND"]
EXPOSE 80  
