FROM alpine:3.16

ENV TZ=Asia/Shanghai \
    GPNU_CONFIG_DIR=/config

RUN apk add --no-cache bash tzdata curl && \
    touch /start.sh && \
    echo "#!/bin/bash"                                     >> /start.sh && \
    echo 'ln -sf /usr/share/zoneinfo/$TZ   /etc/localtime' >> /start.sh && \
    echo 'echo $TZ > /etc/timezone'                        >> /start.sh && \
    echo                                                   >> /start.sh && \
    echo '/GPNU.sh'                                        >> /start.sh && \
    echo                                                   >> /start.sh && \
    echo "crond -f"                                        >> /start.sh && \
    chmod +x /start.sh && \
    (crontab -l ; echo "30 13 * * * /GPNU.sh") | crontab -

COPY --chmod=755 . /

CMD [ "/start.sh" ]