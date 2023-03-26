FROM alpine:3.17

ENV TZ=Asia/Shanghai \
    LANG=C.UTF-8 \
    PS1="\[\e[32m\][\[\e[m\]\[\e[36m\]\u \[\e[m\]\[\e[37m\]@ \[\e[m\]\[\e[34m\]\h\[\e[m\]\[\e[32m\]]\[\e[m\] \[\e[37;35m\]in\[\e[m\] \[\e[33m\]\w\[\e[m\] \[\e[32m\][\[\e[m\]\[\e[37m\]\d\[\e[m\] \[\e[m\]\[\e[37m\]\t\[\e[m\]\[\e[32m\]]\[\e[m\] \n\[\e[1;31m\]$ \[\e[0m\]" \
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