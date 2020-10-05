FROM alpine:latest

ENV SCAN_INTERVAL 1440
ENV SCAN_PORTS 1-1024

RUN apk add --update nginx nmap libxslt bash && \
    rm -f /var/cache/apk/*

COPY nginx.conf /etc/nginx/nginx.conf
COPY entrypoint.sh /entrypoint.sh
COPY nmap-bootstrap.xsl /usr/share/nmap/nmap-bootstrap.xsl

ENTRYPOINT ["/bin/bash", "entrypoint.sh"]
