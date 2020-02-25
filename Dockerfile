FROM alpine:3.11

RUN apk --no-cache add vsftpd

COPY files/entrypoint /
COPY files/vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21 21000-21010

ENTRYPOINT ["/entrypoint"]
