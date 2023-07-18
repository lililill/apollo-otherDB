FROM openjdk:8-jdk-alpine
#jdk采用openjdk8,操作系统采用alpine，减小体积
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
#修改镜像源为阿里源
ENV LANG=en_US.UTF-8
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' >/etc/timezone
#修改时区及默认字符集
 
RUN apk add --update --no-cache ttf-dejavu fontconfig busybox-extras iproute2 curl net-tools tcpdump wget  bash-doc  bash-completion && \
	rm -rf /var/cache/apk/*
#添加常用工具及字符集字体等

ENV APOLLO_RUN_MODE=Docker
ENV SERVER_PORT=8070
EXPOSE 8070

COPY ./apollo-portal  /apollo-portal
#CMD ["/bin/sh", "-c", "tail -f /dev/null"]
CMD ["/apollo-portal/scripts/startup.sh"]

