FROM centos:6.9
MAINTAINER lootan@qq.com
WORKDIR /tmp
RUN curl -k -s -R -O https://monitor.bolaninfo.com/bolanrepo/scripts/install.sh && chmod u+x install.sh
RUN ["./install.sh", "php72", "php56"]
RUN rm ./install.sh
RUN grep -sq "/docker/" /proc/1/cgroup && test -f /etc/init/tty.conf && mv /etc/init/tty.conf /etc/init/tty.conf.BAK	|| :
RUN chkconfig network off	|| :
RUN chkconfig sshd off		|| :
RUN chkconfig xinetd off	|| :
EXPOSE 80
EXPOSE 443
WORKDIR /root
CMD ["/sbin/init"]
