FROM debian:buster

RUN apt-get update && apt-get upgrade -y && \
      apt-get install -y mariadb-server

ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG MYSQL_DATABASE=${MYSQL_DATABASE}
ARG WP_ADMIN=${WP_ADMIN}
ARG WP_ADMIN_PASSWORD=${WP_ADMIN_PASSWORD}
ARG DB_USER=${DB_USER}
ARG DB_PASSWORD=${DB_PASSWORD}

RUN mkdir -p /var/run/mysql
RUN chown mysql:mysql /var/run/mysql

RUN service mysql start && mysql -u root -e "CREATE DATABASE ${MYSQL_DATABASE};" \
&& mysql -u root -e "CREATE USER '${WP_ADMIN}'@'%' IDENTIFIED BY '${WP_ADMIN_PASSWORD}';" \
&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${WP_ADMIN}'@'%';" \
&& mysql -u root -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';" \
&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${DB_USER}'@'%';" \
&& mysql -u root -e "FLUSH PRIVILEGES;"

RUN service mysql stop

COPY ./conf/my.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE 3306

CMD ["mysqld"]

# mariadb-server is enough for the whole thing
# It is imperative that you add the ARG part or it won't find the content of your .env
# creating the mysql dir and setting the permission is CRUCIAL.
# why ? I don't know but i had this fucking code for days and it never worked because it didn't have permissions
# and of course the almighty docker couldn't warn me ? nooooo i had to figure it all out myself ofc
# also don't ask me why am I creating two users, I don't even need the second one but without him the database doesn't link up to wp
# I mean it does, but I get an error trying to access to website
# copying the content of "my.cnf" into the server, i dont really need the whole thing just the "bind-address" part, but it makes the dockerfile bigger
# and mysqld is the command to start the server