FROM phusion/baseimage:18.04-1.0.0-amd64

ENV DEBIAN_FRONTEND noninteractive
ENV PUID=1000 PGID=1000
ENV TZ Asia/Shanghai

COPY sources.list /etc/apt

RUN apt-get update -y && \
    apt-get install -y wget tzdata && \
    wget https://linux-clients.seafile.com/seafile.asc -O /usr/share/keyrings/seafile-keyring.asc && \
    bash -c "echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/seafile-keyring.asc] https://linux-clients.seafile.com/seafile-deb/bionic/ stable main' > /etc/apt/sources.list.d/seafile.list" && \
    apt-get update -y && \
    ln -sf /usr/share/zoneinfo/$TZ /etc/localtime && \
    apt-get install -y seafile-cli && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get clean

WORKDIR /sf

COPY start.sh /sf/start.sh

RUN groupadd -r -g $PGID sfuser && \
    useradd -m -g $PGID -u $PUID sfuser && \
    chown sfuser:sfuser /sf -R && \
    chmod +x /sf/start.sh

USER sfuser

RUN seaf-cli init -d /sf -c /sf/ccnet && \
    ln -s /sf/ccnet /home/sfuser/.ccnet

VOLUME /sf/seafile-data

CMD ["./start.sh"]
