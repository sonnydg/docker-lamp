FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y


RUN apt-get install -y zip unzip
RUN apt-get install -y \
php5.6 \
php5.6-mysql \
php5.6-apc \
php5.6-mcrypt \
php5.6-gd \
php5.6-xml \
php5.6-mbstring \
php5.6-gettext \
php5.6-zip \
curl \
php5.6-curl

RUN apt-get install apache2 libapache2-mod-php7.0 -y


ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb


COPY start_lamp.sh /usr/sbin/


RUN a2enmod rewrite
RUN chmod +x /usr/sbin/start_lamp.sh
RUN chown -R www-data:www-data /var/www/html

VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /etc/apache2


EXPOSE 80

CMD ["/usr/sbin/start_lamp.sh"]
