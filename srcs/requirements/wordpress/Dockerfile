FROM debian:bullseye

WORKDIR /var/www/wordpress/

RUN	apt update -y && \
	apt upgrade -y && \
    ##### Install PHP #####
	apt install -y wget gnupg2 lsb-release && \
    wget https://packages.sury.org/php/apt.gpg && \
    apt-key add apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
    apt update -y && apt install -y php8.1 php8.1-fpm php8.1-mysql && \
	#####    END      #####
    apt install -y mariadb-client

RUN	wget --output-document=/usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x /usr/local/bin/wp && \
    mkdir -p /var/www/wordpress && \
    chown www-data:www-data /var/www/wordpress && \
    wp core download --allow-root
    



