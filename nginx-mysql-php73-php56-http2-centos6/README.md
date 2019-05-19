# Nginx/MySQL/PHP73/PHP56 with HTTP/2 support on CentOS 6:

mysql-5.7.25

nginx-1.16.0

php-5.6.40

php-7.2.18

curl-7.64.1

httpd-2.4.39

jemalloc-4.5.0

memcached-1.5.13

mongodb-4.0.3

nghttp2-1.37.0

openssl-1.0.2o

redis-5.0.4

tengine-2.2.3


-----------------

support HTTP2/HTTPS

Notes: 
1. All above software are installed by using yum as rpm packages compiled with gcc 4.8.5. 
2. The httpd/MySQL/tengine's preset is disable running. 

-----------------

For the phpinfo of php73 and php56, to brower the url :

http://ip:port/2p.html

-----------------

How to run:

Because "opcache.huge_code_pages = 1" is in php7's php.ini, MUST DO on the HOST of docker:

[root@localhost CentOS6]# echo "vm.nr_hugepages = 512" >> /etc/sysctl.d/php7.conf

[root@localhost CentOS6]# sysctl -e -p /etc/sysctl.d/php7.conf

or change "opcache.huge_code_pages=1" to "opcache.huge_code_pages=0" in /etc/php.ini of the docker container.

Then,

[root@localhost CentOS6]# docker run -it --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php73-php56-http2-centos6 /sbin/init

or

[root@localhost CentOS6]# docker run -d  --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php73-php56-http2-centos6 /sbin/init

-----------------

For exmaple:

[root@localhost CentOS6]# cat /etc/sysctl.d/php7.conf

vm.nr_hugepages = 512

[root@localhost CentOS6]# sysctl -a 2>/dev/null | grep vm.nr_hugepages

vm.nr_hugepages = 512

vm.nr_hugepages_mempolicy = 512


[root@localhost CentOS6]# docker run -d --privileged=true -v /sys/fs/cgroup:/sys/fs/cgroup:ro -p 8080:80 lootan/nginx-mysql-php73-php56-http2-centos6
a3bcf5e2b21a6f3c50e7ce8060958d4be93e96cfb2c1baaddbe421dce2e4f2b5

[root@localhost CentOS6]#

[root@localhost CentOS6]# w3m http://localhost:8080/2p.html