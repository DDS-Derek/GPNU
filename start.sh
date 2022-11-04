#!/bin/bash

ln -sf /usr/share/zoneinfo/$TZ   /etc/localtime
echo $TZ > /etc/timezone

/GPNU.sh

crond -f