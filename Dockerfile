FROM alpine:edge

RUN apk update && \
    apk add --no-cache ca-certificates caddy tor zip unzip wget && \
    wget -O Xray-linux-64.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    chmod +x /xray && \
    chmod +R 777 caddy \
    rm -rf /var/cache/apk/*

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD /start.sh
