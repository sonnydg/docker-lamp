FROM ubuntu:latest

ENV DEBIAN_FRONTEND=noninteractive

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
RUN apt-get install apache2 libapache2-mod-php -y


ENV LOG_STDOUT **Boolean**
ENV LOG_STDERR **Boolean**
ENV LOG_LEVEL warn
ENV ALLOW_OVERRIDE All
ENV DATE_TIMEZONE UTC
ENV TERM dumb

ENV LANG=C
ENV APACHE_LOCK_DIR         /var/lock/apache2
ENV APACHE_RUN_DIR          /etc/apache2/
ENV APACHE_PID_FILE         ${APACHE_RUN_DIR}/apache2.pid
ENV APACHE_LOG_DIR          /var/log/apache2
ENV APACHE_RUN_USER         www-data
ENV APACHE_RUN_GROUP        www-data
ENV APACHE_MAX_REQUEST_WORKERS 32
ENV APACHE_MAX_CONNECTIONS_PER_CHILD 1024
ENV APACHE_ALLOW_OVERRIDE   None
ENV APACHE_ALLOW_ENCODED_SLASHES Off
ENV PHP_TIMEZONE            UTC
ENV PHP_MBSTRING_FUNC_OVERLOAD 0
ENV PHP_ALWAYS_POPULATE_RAW_POST_DATA 0
ENV PHP_NEWRELIC_LICENSE_KEY    ""
ENV PHP_NEWRELIC_APPNAME        ""
ENV PHP_SMTP 127.0.0.1
ENV PHP_SMTP_FROM noreply@noreply.com

COPY start_lamp.sh /


RUN a2enmod rewrite
RUN chmod 755 /start_lamp.sh

VOLUME /home
VOLUME /var/www/html
VOLUME /var/log/httpd
VOLUME /etc/apache2


EXPOSE 80

CMD ["/start_lamp.sh"]
#ENTRYPOINT ["/start_lamp.sh"]
#CMD ["apache2"]