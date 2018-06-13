# nginx-mysql-php72-php56-http2-centos6
Nginx/MySQL/PHP56/PHP72 with http/2 support on CentOS6


CentOS 6:

MySQL-5.7.22

Nginx-1.14.0

PHP-5.6.36

PHP-7.2.6

curl-7.59.0

jemalloc-4.5.0

memcached-1.5.6

nghttp2-1.31.1

openssl-1.0.2k

redis-3.2.11

tengine-2.2.2

-----------------
support HTTP2/HTTPS

Notes: 
1. All above software are installed by using yum as rpm packages compiled with gcc 4.8.5. 
2. The httpd/MySQL/tengine's preset is not running. 

-----------------

For the phpinfo of php72 and php56, to brower the url :
http://ip:port/2p.html

-----------------

how to run:

Because "opcache.huge_code_pages = 1" is in php7's php.ini, MUST DO on the HOST of docker:

#echo "vm.nr_hugepages = 512" >> /etc/sysctl.d/php7.conf

#sysctl -e -p /etc/sysctl.d/php7.conf

then,

#docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos6 /sbin/init

or

#docker run -d  --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos6 /sbin/init

-----------------

For exmaple:

[root@localhost CentOS6]# cat /etc/sysctl.d/php7.conf

vm.nr_hugepages = 512

[root@localhost CentOS6]# sysctl -a 2>/dev/null | grep vm.nr_hugepages

vm.nr_hugepages = 512

vm.nr_hugepages_mempolicy = 512

[root@localhost CentOS6]# docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos6 /usr/sbin/init

[  OK  ] Started The nginx HTTP and reverse proxy server.

[  OK  ] Started The PHP FastCGI Process Manager.

[  OK  ] Started The PHP5 FastCGI Process Manager.

[  OK  ] Reached target Multi-User System.

　　　Starting Update UTMP about System Runlevel Changes...
   
[  OK  ] Started Update UTMP about System Runlevel Changes.
