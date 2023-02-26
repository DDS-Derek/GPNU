FROM alpine:3.17

ENV TZ=Asia/Shanghai \
    PS1="\u@\h:\w \$ " \
    GPNU_CONFIG_DIR=/config

COPY --chmod=755 . /

CMD [ "/GPNU.v2.sh" ]
