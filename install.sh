#Pasar a la carpeta de la instalacion
cd /var/www/proyecto_web

#Copiar los virtualhost a las carpetas de apache
sed -i '127.0.0.1	www.mochilasRiMo.com.mx' /etc/hosts

cd archivosConfiguracion

mv proyecto_web.conf /etc/apache2/sites-available
mv proyecto_web_ssl.conf /etc/apache2/sites-available

a2ensite proyecto_web.conf
a2ensite proyecto_web_ssl.conf

systemctl reload apache2
systemctl restart apache2

#Instalar la base de datos

cd /var/www/proyecto_web
su postgres
psql < scriptBD.sql

