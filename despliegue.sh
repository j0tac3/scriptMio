yum install httpd
service httpd start
yum install mysql-server
service mysqld start
/usr/bin/mysql_secure_installation
yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
yum-config-manager --enable remi-php72   [Install PHP 7.2]
yum cd /tmp
curl -sS https://getcomposer.org/installer | php
yum mv composer.phar /usr/local/bin/composer

mysql
echo "CREATE DATABASE BolsaTrabajo CHARACTER SET utf8 COLLATE utf8_spanish_ci;"
echo "CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'Admmin12345_'"
echo "GRANT ALL ON BolsaTrabajo.* TO 'Admin'@'localhost' IDENTIFIED BY 'Admin12345_';"
echo "exit"

yum install git
yum cd /var/www/hmtl/
git clone https://github.com/pantxisto/retoG3.git
yum cd /retoG3/
composer install
yum chmod -R 777 storage
yum chmod -R 777 bootstrap/cache
php artisan migrate:refresh --seed