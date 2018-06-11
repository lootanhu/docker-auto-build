# nginx-mysql-php72-php56-http2-centos7
Nginx/MySQL/PHP56/PHP72 with http/2 support on CentOS7


CentOS 7：

MySQL-5.7.22

Nginx-1.14.0

PHP-5.6.36

PHP-7.2.6

curl-7.59.0

jemalloc-4.5.0

memcached-1.5.6

nghttp2-1.31.1

redis-3.2.11

tengine-2.2.2

-----------------

support HTTP2/HTTPS

Notes: 
1. MySQL/tengine's preset is not running.

-----------------

For the phpinfo of php72 and php56, to brower the url :
http://ip:port/2p.html

-----------------

how to run:

Because "opcache.huge_code_pages = 1" is in php7's php.ini, MUST DO on the HOST of docker:

#echo "vm.nr_hugepages = 512" >> /etc/sysctl.d/php7.conf

#sysctl -e -p /etc/sysctl.d/php7.conf

then,

#docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos7 /usr/sbin/init

or

#docker run -d  --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php72-php56-http2-centos7 /usr/sbin/init
