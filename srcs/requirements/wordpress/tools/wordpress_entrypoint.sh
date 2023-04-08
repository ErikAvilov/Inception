#!/bin/sh

wp core download --allow-root --path=/var/www/html/wordpress >> /var/www/html/build.log

wp config create --dbcharset=utf8mb4 --dbname=$MYSQL_DATABASE --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOSTNAME --allow-root --path=/var/www/html/wordpress --skip-check >> /var/www/html/build.log

wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=eavilov@student.42lyon.fr --allow-root --path=/var/www/html/wordpress >> /var/www/html/build.log

wp user create Correcteur user@student.42lyon.fr --user_pass=$DB_PASSWORD --display_name="Correcteur très beau et raisonnablement sympa" --role=contributor --allow-root --path=/var/www/html/wordpress >> /var/www/html/build.log

php-fpm7.3 -F


# Every sets of instructions sends the result into a log file so I can figure out why the fuck is it not starting
# 1. Downloading the Wordpress core files and specifying the download path
# 2. This set of commands modifies the wp-config.php file, this was the most annoying part of the project to figure out
# 3. Sets up the whole website with the help of your configuration, make sure your config is correct or it won't work
# 4. Creating a random user with no particular rights to test it out
# 5. Executing the daemon in the foreground so it starts waiting for signals from the browser

# Make sure to always specify the paths for your commands, i use --allow-root which is objectively a bad habit but i don't care i want to end this torture
# Without --allow-root the commands will simply not work and i was too tired to find an alternative
