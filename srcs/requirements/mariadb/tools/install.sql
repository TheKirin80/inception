CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'akefeder'@'%' IDENTIFIED BY 'coucou';
GRANT ALL PRIVILEGES ON wordpress.* TO 'akefeder'@'%' IDENTIFIED BY 'coucou';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootcoucou';
FLUSH PRIVILEGES;