FROM rupeshsaini09/centos
RUN yum install httpd unzip -y
ADD https://www.free-css.com/assets/files/free-css-templates/download/page287/eflyer.zip /var/www/html
WORKDIR /var/www/html
RUN unzip eflyer.zip
RUN rm -rf eflyer.zip
RUN cp -rf html/* .
RUN rm -rf html
Expose 80
CMD httpd -DFOREGROUND
