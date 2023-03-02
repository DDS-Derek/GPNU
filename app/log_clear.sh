#!/bin/bash

if [ ! -f ${GPNU_CONFIG_DIR}/config.sh ]; then
    exit 1
else
    # 获取配置文件配置
    . ${GPNU_CONFIG_DIR}/config.sh
    while true; do
    echo "" > /app/GPNU.txt
    sleep ${CLEAR_CRON}
    done
fi