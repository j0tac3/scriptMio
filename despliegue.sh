ifdown ens33
ifup ens33

yum update
yum install open-vm-tools -y
yum install open-vm-tools-desktop

yum install httpd
systemctl enable httpd
systemctl start httpd
firewall-cmd --permanent --zone=public --add-service=http
firewall-cmd --permanent --zone=public --add-service=https
firewall-cmd --reload
systemctl status httpd

yum install mariadb-server mariadb
systemctl start mariadb
mysql_secure_installation
systemctl enable mariadb.service

yum install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm
yum install yum-utils
yum-config-manager --enable remi-php72   [Install PHP 7.2]

yum install install php-common php-mbstring php-xml php-zip php-mysql php-pgsql php-pdo-pgsql
systemctl restart httpd
