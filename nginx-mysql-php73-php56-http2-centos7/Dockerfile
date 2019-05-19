FROM centos
MAINTAINER LootanHu <lootan@qq.com>
WORKDIR /tmp
RUN curl -k -s -R -O https://www.moreface.com.cn/lootanrepo/scripts/install.sh && chmod u+x install.sh
RUN ./install.sh php73 php56
RUN rm ./install.sh			|| :
RUN systemctl disable getty@tty1	|| :
RUN systemctl disable network		|| :
RUN systemctl disable sshd		|| :
RUN systemctl disable xinetd		|| :
EXPOSE 80
EXPOSE 443
WORKDIR /root
CMD ["/sbin/init"]