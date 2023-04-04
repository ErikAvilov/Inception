FROM debian:buster

RUN apt-get update && apt-get install -y \
    	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/wp-config.php /var/www/html/
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

COPY ./tools/entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

WORKDIR /var/www/html

RUN chown -R www-data:www-data /var/www/html/

VOLUME /var/www/html

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]

