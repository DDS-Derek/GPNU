FROM alpine:3.17

ENV TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ " \
    GPNU_CONFIG_DIR=/config

RUN apk add --no-cache bash tzdata curl grep

COPY --chmod=755 ./GPNU.v2.sh /GPNU.v2.sh

CMD [ "bash", "/GPNU.v2.sh" ]
