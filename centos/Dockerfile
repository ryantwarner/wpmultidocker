FROM centos:centos7
LABEL maintainer="Ryan Warner <rtwarner@gmail.com>"

RUN yum -y update && \
	yum -y install \
	epel-release \
	httpd \
	unzip \
	wget \
	openssl \
	openssl-libs

# -----------------------------------------------------------------------------
# Apache 2.4 + (PHP 7.2 from Remi)
# -----------------------------------------------------------------------------
RUN yum -y install http://rpms.remirepo.net/enterprise/remi-release-7.rpm && \
	yum-config-manager --enable remi-php72 && \
	yum -y install \
	php72-php \
	php72-php-common \
	php72-php-devel \
	php72-php-mysqlnd \
	php72-php-mbstring \
	php72-php-json \
	php72-php-gd \
	php72-php-ldap \
	php72-php-pear \
	php72-php-pdo \
	php72-php-intl \
	php72-php-xml \
	php72-php-cli \
	php72-php-zip \
	php72-php-runtime \
	mod_ssl \
	libaio \
	libnghttp2 \
	libcurl \
	nano \
	mysql && \
	sed -i 's/;error_log = syslog/error_log = \/dev\/stderr/' /etc/opt/remi/php72/php.ini && \
	sed -i 's/#ServerName www.example.com:443/ServerName local.carleton.ca:443/' /etc/httpd/conf.d/ssl.conf && \
	ln -sf /dev/stdout /var/log/httpd/access_log && \
	ln -sf /dev/stderr /var/log/httpd/error_log && \
	ln -sf /usr/bin/php72-pear /usr/bin/pear && \
	ln -sf /opt/remi/php72/root/usr/share/php /usr/share/php && \
	chmod -R g+w /opt/remi/php72/root/usr/share/php && \
	ln -sf /var/opt/remi/php72/lib/php /var/lib/php && \
	chmod -R g+w /var/www/html && \
	yum clean all && \
	rm -rf /var/cache/yum && \
	rm -f /etc/httpd/conf.d/{userdir.conf,welcome.conf} && \
	ln -s /usr/bin/php72 /usr/bin/php && \
	php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
	php composer-setup.php --install-dir=/usr/local/bin --filename=composer

COPY ssl/localhost.key /etc/pki/tls/private/localhost.key
COPY ssl/localhost.crt /etc/pki/tls/certs/localhost.crt

# -----------------------------------------------------------------------------
# Set ports and env variable HOME
# -----------------------------------------------------------------------------
EXPOSE 80
EXPOSE 443

ENV HOME /var/www/html

# -----------------------------------------------------------------------------
# Start
# -----------------------------------------------------------------------------
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]