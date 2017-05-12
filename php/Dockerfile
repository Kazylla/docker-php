FROM php:5.6-fpm
RUN groupadd -g 1000 app
RUN useradd -g app -m -u 1000 -d /home/app -s /bin/bash app
RUN apt-get update && \
    apt-get install -y git zip unzip vim libmcrypt-dev uuid-dev php5-xdebug && \
    docker-php-ext-install mcrypt opcache pdo_mysql && \
    echo "zend_extension=/usr/lib/php5/20131226/xdebug.so" > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN pecl install redis-3.1.2 && \
    pecl install uuid-1.0.4 && \
    pecl install apcu-4.0.7 && \
    docker-php-ext-enable redis uuid apcu
RUN curl -sS https://getcomposer.org/installer -o composer-setup.php && \
    php composer-setup.php && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update && \
    rm composer-setup.php
RUN mkdir /var/log/php-fpm && \
    mkdir /var/lib/php && \
    chown app.app /var/log/php-fpm && \
    chown app.app /var/lib/php
COPY config/xdebug.ini /usr/local/etc/php/conf.d/
CMD ["php-fpm"]
