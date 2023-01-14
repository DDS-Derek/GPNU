FROM alpine:3.17

ENV TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ " \
    GPNU_CONFIG_DIR=/config

RUN apk add --no-cache bash tzdata curl && \
    (crontab -l ; echo "30 13 * * * /GPNU.sh") | crontab -

COPY --chmod=755 . /

CMD [ "/start.sh" ]
