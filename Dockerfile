FROM alpine:3.15.1

RUN apk add --no-cache clamav clamav-libunrar

COPY entrypoint.sh /sbin

RUN mkdir -p /run/clamav && \
    touch /run/clamav/junk && \
    chown -R clamav:clamav /run/clamav


RUN sed -i 's/^#Foreground .*$/Foreground yes/g' /etc/clamav/clamd.conf && \
    sed -i 's/^#TCPSocket .*$/TCPSocket 3310/g' /etc/clamav/clamd.conf && \
    sed -i 's/^(LogFile .*)$/#\1/g' /etc/clamav/clamd.conf && \
    sed -i 's/^#Foreground .*$/Foreground yes/g' /etc/clamav/freshclam.conf && \
    sed -i 's/^#Checks .*$/Checks 24/g' /etc/clamav/freshclam.conf

CMD [ "/sbin/entrypoint.sh" ]

