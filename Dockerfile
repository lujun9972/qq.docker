FROM ubuntu:18.04
RUN sed -i 's#http://archive.ubuntu.com/ubuntu#http://mirrors.aliyun.com/ubuntu#' /etc/apt/sources.list
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install -y libgtk2.0-0 wget libnss3 locales  && rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apk/* && apt-get autoremove
WORKDIR /tmp
RUN wget https://qd.myapp.com/myapp/qqteam/linuxQQ/linuxqq_2.0.0-b1-1024_amd64.deb && dpkg -i linuxqq*.deb && rm -rf linuxqq*.deb
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
CMD "/usr/share/tencent-qq/qq"
