FROM alpine:3.17

ENV TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ " \
    GPNU_CONFIG_DIR=/config

RUN apk add --no-cache \
        bash \
        tzdata \
        curl \
        grep \
        s6-overlay \
        nginx \
        php81 \
        php81-fpm \
    && sed -i "s/user = nobody/user = nginx/g" /etc/php81/php-fpm.d/www.conf \
    && sed -i "s/group = nobody/group = nginx/g" /etc/php81/php-fpm.d/www.conf

COPY --chmod=755 ./app /app
COPY --chmod=755 ./docker /

ENTRYPOINT [ "/init" ]

EXPOSE 80
VOLUME [ "/config" ]