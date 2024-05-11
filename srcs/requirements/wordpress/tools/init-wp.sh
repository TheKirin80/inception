if [ -z "$(ls -A /var/www/wordpress)" ]; then # ici on verifie si le volume de wordpress possede l'installation
	wp core download --allow-root
else
	chown -R www-data:www-data /var/www/wordpress/
fi

if [ ! -f /var/www/wordpress/wp-config.php ]; then # ici on verifie si le volume de wordpress possede la configuration voulu 
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_USER_PASSWORD --dbhost=$MYSQL_HOST
	wp db create
	wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_ADMIN_USER --admin_password=$WORDPRESS_ADMIN_PASSWORD --admin_email=$WORDPRESS_ADMIN_EMAIL
    wp user create $WORDPRESS_USER $WORDPRESS_USER_EMAIL --user_pass=$WORDPRESS_USER_PASSWORD --role=author
	chown -R www-data:www-data /var/www/wordpress/
	chmod -R 775 /var/www/wordpress/
fi

exec /usr/sbin/php-fpm8.1 -F