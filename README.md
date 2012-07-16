zendsamples project
===========
To run the application in Web Server:

1. Create application.ini file with same contents of application.ini.default in
the same directory (/application/configs)

2. Set Web Server to listen in port 10088 (for example). In Apache add this to
httpd.conf (/user/local/zend/apache2/conf/ if using Zend Server in Mac):

	Listen 10088

3. Un-comment the following line in httpd.conf

	Include conf/extra/httpd-vhosts.conf

4. Create VHOST in Web Server. In Apache add this to httpd-vhosts,conf 
(/user/local/zend/apache2/conf/extra/ if using Zend Server in Mac):

	<VirtualHost *:10088>
		ServerName zendbootcamp
	    DocumentRoot "/usr/local/zend/apache2/htdocs/zendbootcamp/public"
	    
	    SetEnv APPLICATION_ENV "development"
	     
		<Directory /usr/local/zend/apache2/htdocs/zendbootcamp/public>
			AllowOverride All
			Order allow,deny
			Allow from all
		</Directory>
	</VirtualHost>

5. Add the following to /etc/hosts:

	127.0.0.1	zendbootcamp

6. Run the sql files in sql folder against your database

7. Set your database username and password in application.ini
