FROM centos:6
MAINTAINER LootanHu <lootan@qq.com>
WORKDIR /tmp
RUN curl -k -s -R -O http://www.moreface.com.cn/lootanrepo/scripts/install.sh && chmod u+x install.sh
RUN ./install.sh php74 php56
RUN rm ./install.sh		|| :
RUN chkconfig network off	|| :
RUN chkconfig sshd off		|| :
RUN chkconfig xinetd off	|| :
RUN grep -sq "/docker/" /proc/1/cgroup && test -f /etc/init/start-ttys.conf && mv /etc/init/start-ttys.conf /etc/init/start-ttys.conf.BAK	|| :
EXPOSE 80
EXPOSE 443
WORKDIR /root
CMD ["/sbin/init"]
