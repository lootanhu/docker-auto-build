FROM centos
MAINTAINER lootan@qq.com
WORKDIR /tmp
RUN curl -k -s -R -O https://47.74.23.69:7080/lootanrepo/scripts/install.sh && chmod u+x install.sh
RUN ["./install.sh", "php72", "47.74.23.69:7080", "php56"]
RUN rm ./install.sh
RUN systemctl disable getty@tty1	|| :
RUN systemctl disable network		|| :
RUN systemctl disable sshd		|| :
RUN systemctl disable xinetd		|| :
EXPOSE 80
EXPOSE 443
WORKDIR /root
CMD ["/sbin/init"]
