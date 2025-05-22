FROM alpine:3.21.3

RUN apk add --no-cache \
    drill=1.8.4-r0 \
    tini=0.19.0-r3 \
    unbound=1.22.0-r0

EXPOSE 53/tcp
EXPOSE 53/udp

ENTRYPOINT ["/sbin/tini", "--"]
CMD ["/usr/sbin/unbound", "-d", "-p"]
USER unbound
