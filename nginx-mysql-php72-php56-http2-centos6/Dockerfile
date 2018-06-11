FROM centos:6.9
MAINTAINER lootan@qq.com
WORKDIR /tmp
RUN curl -k -s -R http://images.bolanjr.com/bolanrepo/scripts/install.sh -o install.sh && chmod u+x install.sh
RUN ["./install.sh", "php72", "php56", "nocleanyum"]
RUN rm ./install.sh
RUN chkconfig network off
RUN chkconfig sshd off
RUN chkconfig xinetd off
WORKDIR /root
EXPOSE 80
EXPOSE 443
CMD ["/sbin/init"]