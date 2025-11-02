FROM alpine:3.22
LABEL maintainer="Michael BD7MQB <bd7mqb@qq.com>"

ARG TARGETPLATFORM
RUN apk update
RUN apk --no-cache add curl tzdata

ADD /etc/mosdns /etc/mosdns
ADD /entrypoint.sh /app/entrypoint.sh
ADD /bin/$TARGETPLATFORM/mosdns /app/mosdns
RUN chmod +x /etc/mosdns/rules/update-cdn && \
    ln -s /etc/mosdns/rules/update-cdn /etc/periodic/daily/update-cdn

ENV TZ=Asia/Shanghai
WORKDIR /app

EXPOSE 53/tcp 53/udp

# RUN echo "*/1 * * * * root echo 'test' > /dev/stdout" >> /etc/crontabs/root

ENTRYPOINT ["./entrypoint.sh"]
CMD ["./mosdns", "start", "-d", "/etc/mosdns", "-c", "config.yaml"]