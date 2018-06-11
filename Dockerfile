FROM centos
MAINTAINER lootan@qq.com
WORKDIR /tmp
RUN curl -k -s -R http://images.bolanjr.com/bolanrepo/scripts/install.sh -o install.sh && chmod u+x install.sh
RUN ["./install.sh", "php72", "php56", "nocleanyum"]
RUN rm ./install.sh
RUN systemctl disable network
RUN systemctl disable sshd
RUN systemctl disable xinetd
WORKDIR /root
EXPOSE 80
EXPOSE 443
CMD ["/sbin/init"]
