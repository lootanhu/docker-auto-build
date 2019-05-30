# Nginx/MySQL/PHP72/PHP56 with HTTP/2 support on CentOS 7:

mysql-5.7.25

nginx-1.16.0

php-5.6.40

php-7.2.18

curl-7.65.0

httpd-2.4.39

jemalloc-4.5.0

memcached-1.5.16

mongodb-4.0.3

nghttp2-1.37.0

openssl-1.0.2o

redis-5.0.4

tengine-2.2.3

-----------------

support HTTP2/HTTPS

Notes: 

1. All above software are installed by using yum as rpm packages. 
2. The preset of httpd/MySQL/tengine is disable running. 

-----------------

For the phpinfo of php72 and php56, to brower the url:

http://ip:port/2p.html

-----------------

How to run:

Because "opcache.huge_code_pages = 1" is in php7's php.ini, MUST DO on the HOST of docker:

[root@localhost CentOS7]# echo "vm.nr_hugepages = 512" >> /etc/sysctl.d/php7.conf

[root@localhost CentOS7]# sysctl -e -p /etc/sysctl.d/php7.conf

or change "opcache.huge_code_pages=1" to "opcache.huge_code_pages=0" in /etc/php.ini of the docker container.

Then,

[root@localhost CentOS7]# docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos7 /usr/sbin/init

or

[root@localhost CentOS7]# docker run -d  --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos7 /usr/sbin/init

-----------------

For exmaple:

[root@localhost CentOS7]# docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos7 /usr/sbin/init

[  OK  ] Started The nginx HTTP and reverse proxy server.

[  OK  ] Started The PHP FastCGI Process Manager.

[  OK  ] Started The PHP5 FastCGI Process Manager.

[  OK  ] Reached target Multi-User System.

　　　Starting Update UTMP about System Runlevel Changes...
   
[  OK  ] Started Update UTMP about System Runlevel Changes.



Then,

[root@localhost ~]#

[root@localhost ~]# w3m http://localhost:8080/2p.html
