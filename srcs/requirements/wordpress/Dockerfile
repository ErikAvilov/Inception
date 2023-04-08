FROM debian:buster

ENV MYSQL_USER=${MYSQL_USER}
ENV MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ENV MYSQL_PASSWORD=${MYSQL_PASSWORD}
ENV MYSQL_DATABASE=${MYSQL_DATABASE}
ENV MYSQL_HOSTNAME=${MYSQL_HOSTNAME}

RUN apt-get update -y && \
	mkdir /run/php && \
	apt-get install php7.3 php-mysqli php-fpm wget -y

RUN mkdir -p /var/www/html && \
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp && \
	useradd -ms /bin/bash ea

COPY ./tools/wordpress_entrypoint.sh /
COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/
RUN chmod +x /wordpress_entrypoint.sh

WORKDIR /var/www/html

EXPOSE 9000

ENTRYPOINT ["/wordpress_entrypoint.sh"]

# On a side note, this is the bare minimum required to pass the project
# If you ever feel the need to tinker inside the container you'll need to install additional stuff
# like vim to edit the files or whatever you can think of
# Also i tried putting comments in the conf file but it fucked up the container