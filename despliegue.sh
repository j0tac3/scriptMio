########Reiniciar interfaz de red#####

ifdown ens33
ifup ens33

yum update
yum install open-vm-tools -y
yum install open-vm-tools-desktop

###############Intalar apache#############

yum install httpd
systemctl enable httpd
systemctl start httpd
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
systemctl status httpd

########Introducir reglas para poder acceder desde el exterior########

#iptables -I INPUT -i ens33 -p tcp -m tcp --dport 80 -j ACCEPT
#vi /etc/sysconfig/iptables
##############Introducir las siguientes reglas al final del archivo########
####################################################
#-A INPUT -i ens33 -p tcp -m tcp --dport 80 -j ACCEPT
####################################################
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
#-A INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT

#############Intalar MariaDB############

yum install mariadb-server mariadb
systemctl start mariadb
mysql_secure_installation
systemctl enable mariadb.service

###########Instalar PHP 7##########

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
yum-config-manager --enable remi-php72   [Install PHP 7.2]

#########Instalar dependencias necesarias de PHP##########

yum install install php-common php-mbstring php-xml php-zip php-mysql php-pgsql php-pdo-pgsql
yum service httpd restart

#############Instalar Composer########

#cd /tmp
#curl -sS https://getcomposer.org/installer | php
#mv composer.phar /usr/local/bin/composer

#############Crear Base de Datos############

#mysql
#echo "CREATE DATABASE BolsaTrabajo CHARACTER SET utf8 COLLATE utf8_spanish_ci;"
#echo "CREATE USER 'Admin'@'localhost' IDENTIFIED BY 'Admmin12345_'"
#echo "GRANT ALL ON BolsaTrabajo.* TO 'Admin'@'localhost' IDENTIFIED BY 'Admin12345_';"
#echo "exit"

########Instalar git y bajar repositorio#######

#install git
#cd /var/www/hmtl/
#git clone https://github.com/pantxisto/retoG3.git

#########Configurar proyecto############

#cd /retoG3/
#composer install
#chmod -R 777 storage
#chmod -R 777 bootstrap/cache
#php artisan migrate:refresh --seed