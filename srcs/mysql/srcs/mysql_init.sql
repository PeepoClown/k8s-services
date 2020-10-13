CREATE DATABASE wordpress;
CREATE USER 'wupdegra'@'localhost' IDENTIFIED BY '12345';
GRANT ALL PRIVILEGES ON wordpress.* TO 'wupdegra'@'localhost';
FLUSH PRIVILEGES;
