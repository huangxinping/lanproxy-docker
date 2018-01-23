FROM centos:latest

MAINTAINER huangxin xinping <o0402@outlook.com>

RUN mkdir -p /usr/local/proxy-server
COPY proxy-server-20171116/ /usr/local/proxy-server

RUN yum update -y \
    && yum install -y java-1.8.0-openjdk-devel.x86_64 \
    && echo "#set java environment" >> /etc/profile \
    && echo "JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk-1.8.0.141-1.b16.el7_3.x86_64" >> /etc/profile \
    && echo "JRE_HOME=$JAVA_HOME/jre" >> /etc/profile \
    && echo "CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib" >> /etc/profile \
    && echo "PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin" >> /etc/profile \
    && echo "export JAVA_HOME JRE_HOME CLASS_PATH PATH" >> /etc/profile \
    && source /etc/profile \
    && cd /usr/local/proxy-server/bin \
    && chmod +x startup.sh

WORKDIR /usr/local/proxy-server/bin

EXPOSE 8090
EXPOSE 4900
EXPOSE 4993
EXPOSE 50000-50999

CMD ["bash", "startup.sh"]
