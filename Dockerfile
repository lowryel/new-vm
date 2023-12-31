# FROM php:7.2-fpm-alpine AS builder

# WORKDIR /var/www/html/

# # Copy composer.lock and composer.json
# COPY myapp/composer.lock myapp/composer.json /var/www/html/

# # Install Additional dependencies
# RUN apk update && apk add --no-cache \
#     build-base shadow vim curl \
#     php7 \
#     php7-fpm \
#     php7-common \
#     php7-pdo \
#     php7-pdo_mysql \
#     php7-mysqli \
#     php7-mcrypt \
#     php7-mbstring \
#     php7-xml \
#     php7-openssl \
#     php7-json \
#     php7-phar \
#     php7-zip \
#     php7-gd \
#     php7-dom \
#     php7-session \
#     php7-zlib


# # Add and Enable PHP-PDO Extenstions
# RUN docker-php-ext-install pdo pdo_mysql
# RUN docker-php-ext-enable pdo_mysql

# # Install PHP Composer
# RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# # Remove Cache
# RUN rm -rf /var/cache/apk/*

# # Add UID '1000' to www-data
# RUN usermod -u 1000 www-data


# # RUN apt install -y php-cli php-mysql php-curl
# # RUN apt-get install -y mysql-server
# COPY chown -R www-data:www-data . /var/www/html/
# USER www-data

# # Expose port 9000 and start php-fpm server
# EXPOSE 9000
# CMD ["php-fpm"]




FROM php:7.2-fpm-alpine AS builder

WORKDIR /var/www/html/

# Copy composer.lock and composer.json
COPY laravel-app/composer.json /var/www/html/

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib


# Add and Enable PHP-PDO Extenstions
RUN docker-php-ext-install pdo pdo_mysql
RUN docker-php-ext-enable pdo_mysql

COPY laravel-app/ /var/www/html/

FROM php:7.2-fpm-alpine

WORKDIR /myapp/
COPY --from=builder /var/www/html/ $HOME/myapp/
COPY provisioning/templates/nginx/default $HOME/myapp/

# Install PHP Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
# RUN useradd www-data && usermod -u 1000 www-data


COPY chown -R www-data:www-data . $HOME/myapp/
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]
