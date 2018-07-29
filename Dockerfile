FROM ubuntu:latest

RUN apt-get update
RUN apt-get upgrade -y


RUN apt-get install -y zip unzip
RUN apt-get install -y \
	php \
	php-bz2 \
	php-cgi \
	php-cli \
	php-common \
	php-curl \
	php-dev \
	php-enchant \
	php-fpm \
	php-gd \
	php-gmp \
	php-imap \
	php-interbase \
	php-intl \
	php-json \
	php-ldap \
	php-mbstring \
	php-mysql \
	php-odbc \
	php-opcache \
	php-pgsql \
	php-phpdbg \
	php-pspell \
	php-readline \
	php-recode \
	php-snmp \
	php-sqlite3 \
	php-sybase \
	php-tidy \
	php-xmlrpc \
	php-xsl \
	php-zip

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
