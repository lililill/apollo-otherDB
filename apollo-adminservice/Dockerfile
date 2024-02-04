FROM arm64v8/openjdk:8

RUN ln -snf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN echo 'Asia/Shanghai' > /etc/timezone

ENV APOLLO_RUN_MODE=Docker
ENV SERVER_PORT=8090
EXPOSE 8090

COPY ./apollo-adminservice  /apollo-adminservice
#CMD ["/bin/sh", "-c", "tail -f /dev/null"]
CMD ["/apollo-adminservice/scripts/startup.sh"]

