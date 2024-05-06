CREATE DATABASE IF NOT EXISTS wordpress;
CREATE USER IF NOT EXISTS 'akefeder'@'%' IDENTIFIED BY 'coucou';
GRANT ALL PRIVILEGES ON wordpress.* TO 'akefeder'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY 'rootcoucou';
FLUSH PRIVILEGES;
