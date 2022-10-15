#!/bin/bash

#------------------------------------------------------------------------------------------------------------------------------------------
## 创建配置文件
version_dir_old=${version_dir}/old

if [ ! -d $GPNU_CONFIG_DIR ]; then
	mkdir -p $GPNU_CONFIG_DIR
fi

if [ ! -f ${GPNU_CONFIG_DIR}/config.sh ]; then

touch ${GPNU_CONFIG_DIR}/config.sh

cat > ${GPNU_CONFIG_DIR}/config.sh <<EOF
#!/bin/bash

TGBOT_SEND_CHATID=
TGBOT_SEND_TOKEN=

version_dir=/version

EOF

echo "配置文件以生成，请配置完成后重新运行脚本"

exit

fi

#------------------------------------------------------------------------------------------------------------------------------------------
## 获取配置文件配置
. ${GPNU_CONFIG_DIR}/config.sh

#------------------------------------------------------------------------------------------------------------------------------------------
## 创建版本缓存文件夹
version_dir_old=${version_dir}/old

if [ ! -d $version_dir ]; then
	mkdir -p $version_dir
fi

if [ ! -d $version_dir_old ]; then
	mkdir -p $version_dir_old
fi

#------------------------------------------------------------------------------------------------------------------------------------------
## 版本查寻对比

## mayswind/AriaNg

mayswind_AriaNg_file=mayswind_AriaNg_version

if [ ! -f ${version_dir}/${mayswind_AriaNg_file} ]; then
    touch ${version_dir}/${mayswind_AriaNg_file}
    echo "0.0.0" > ${version_dir}/${mayswind_AriaNg_file}
fi

mayswind_AriaNg_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/mayswind/AriaNg/tags | grep 'name' | cut -d\" -f4 | head -1)
mayswind_AriaNg_version_old=$(cat $version_dir/${mayswind_AriaNg_file} | head -n1)

if [ "${mayswind_AriaNg_version_new}" != "${mayswind_AriaNg_version_old}" ]; then
    if [ -f ${version_dir_old}/${mayswind_AriaNg_file} ]; then
        rm -rf ${version_dir_old}/${mayswind_AriaNg_file}
    fi
    cp ${version_dir}/${mayswind_AriaNg_file} ${version_dir_old}/${mayswind_AriaNg_file}
    echo "${mayswind_AriaNg_version_new}" > ${version_dir}/${mayswind_AriaNg_file}
fi

mayswind_AriaNg_version_send=$(
if [ "${mayswind_AriaNg_version_new}" != "${mayswind_AriaNg_version_old}" ]; then
    echo "AriaNg版本变动 | ${mayswind_AriaNg_version_old} --> ${mayswind_AriaNg_version_new} "
else
    echo "AriaNg版本未变动 | 最新版本为${mayswind_AriaNg_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## c0re100/qBittorrent-Enhanced-Edition

c0re100_qBittorrent_ee_file=c0re100_qBittorrent_ee_version

if [ ! -f ${version_dir}/${c0re100_qBittorrent_ee_file} ]; then
    touch ${version_dir}/${c0re100_qBittorrent_ee_file}
    echo "0.0.0" > ${version_dir}/${c0re100_qBittorrent_ee_file}
fi

c0re100_qBittorrent_ee_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/c0re100/qBittorrent-Enhanced-Edition/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -c 9-)
c0re100_qBittorrent_ee_version_old=$(cat $version_dir/${c0re100_qBittorrent_ee_file} | head -n1)

if [ "${c0re100_qBittorrent_ee_version_new}" != "${c0re100_qBittorrent_ee_version_old}" ]; then
    if [ -f ${version_dir_old}/${c0re100_qBittorrent_ee_file} ]; then
        rm -rf ${version_dir_old}/${c0re100_qBittorrent_ee_file}
    fi
    cp ${version_dir}/${c0re100_qBittorrent_ee_file} ${version_dir_old}/${c0re100_qBittorrent_ee_file}
    echo "${c0re100_qBittorrent_ee_version_new}" > ${version_dir}/${c0re100_qBittorrent_ee_file}
fi

c0re100_qBittorrent_ee_version_send=$(
if [ "${c0re100_qBittorrent_ee_version_new}" != "${c0re100_qBittorrent_ee_version_old}" ]; then
    echo "c0re100/qBittorrent-Enhanced-Edition版本变动 | ${c0re100_qBittorrent_ee_version_old} --> ${c0re100_qBittorrent_ee_version_new} "
else
    echo "c0re100/qBittorrent-Enhanced-Edition版本未变动 | 最新版本为${c0re100_qBittorrent_ee_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## userdocs/qbittorrent-nox-static

userdocs_qbittorrent_nox_static_file=userdocs_qbittorrent_nox_static_version

if [ ! -f ${version_dir}/${userdocs_qbittorrent_nox_static_file} ]; then
    touch ${version_dir}/${userdocs_qbittorrent_nox_static_file}
    echo "0.0.0" > ${version_dir}/${userdocs_qbittorrent_nox_static_file}
fi

userdocs_qbittorrent_nox_static_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/userdocs/qbittorrent-nox-static/tags | grep 'name' | cut -d\" -f4 | head -1 | cut -c 9- )
userdocs_qbittorrent_nox_static_version_old=$(cat $version_dir/${userdocs_qbittorrent_nox_static_file} | head -n1)

if [ "${userdocs_qbittorrent_nox_static_version_new}" != "${userdocs_qbittorrent_nox_static_version_old}" ]; then
    if [ -f ${version_dir_old}/${userdocs_qbittorrent_nox_static_file} ]; then
        rm -rf ${version_dir_old}/${userdocs_qbittorrent_nox_static_file}
    fi
    cp ${version_dir}/${userdocs_qbittorrent_nox_static_file} ${version_dir_old}/${userdocs_qbittorrent_nox_static_file}
    echo "${userdocs_qbittorrent_nox_static_version_new}" > ${version_dir}/${userdocs_qbittorrent_nox_static_file}
fi

userdocs_qbittorrent_nox_static_version_send=$(
if [ "${userdocs_qbittorrent_nox_static_version_new}" != "${userdocs_qbittorrent_nox_static_version_old}" ]; then
    echo "userdocs/qBittorrent版本变动 | ${userdocs_qbittorrent_nox_static_version_old} --> ${userdocs_qbittorrent_nox_static_version_new} "
else
    echo "userdocs/qBittorrent版本未变动 | 最新版本为${userdocs_qbittorrent_nox_static_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## icret/EasyImages2.0

icret_EasyImages2_0_file=icret_EasyImages2_0_version

if [ ! -f ${version_dir}/${icret_EasyImages2_0_file} ]; then
    touch ${version_dir}/${icret_EasyImages2_0_file}
    echo "0.0.0" > ${version_dir}/${icret_EasyImages2_0_file}
fi

icret_EasyImages2_0_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/icret/EasyImages2.0/tags | grep 'name' | cut -d\" -f4 | sed -n '2p')
icret_EasyImages2_0_version_old=$(cat $version_dir/${icret_EasyImages2_0_file} | head -n1)

if [ "${icret_EasyImages2_0_version_new}" != "${icret_EasyImages2_0_version_old}" ]; then
    if [ -f ${version_dir_old}/${icret_EasyImages2_0_file} ]; then
        rm -rf ${version_dir_old}/${icret_EasyImages2_0_file}
    fi
    cp ${version_dir}/${icret_EasyImages2_0_file} ${version_dir_old}/${icret_EasyImages2_0_file}
    echo "${icret_EasyImages2_0_version_new}" > ${version_dir}/${icret_EasyImages2_0_file}
fi

icret_EasyImages2_0_version_send=$(
if [ "${icret_EasyImages2_0_version_new}" != "${icret_EasyImages2_0_version_old}" ]; then
    echo "EasyImages2.0版本变动 | ${icret_EasyImages2_0_version_old} --> ${icret_EasyImages2_0_version_new} "
else
    echo "EasyImages2.0版本未变动 | 最新版本为${icret_EasyImages2_0_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## BGmi/BGmi

BGmi_file=BGmi_version

if [ ! -f ${version_dir}/${BGmi_file} ]; then
    touch ${version_dir}/${BGmi_file}
    echo "0.0.0" > ${version_dir}/${BGmi_file}
fi

BGmi_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/BGmi/BGmi/tags | grep 'name' | cut -d\" -f4 | head -1)
BGmi_version_old=$(cat $version_dir/${BGmi_file} | head -n1)

if [ "${BGmi_version_new}" != "${BGmi_version_old}" ]; then
    if [ -f ${version_dir_old}/${BGmi_file} ]; then
        rm -rf ${version_dir_old}/${BGmi_file}
    fi
    cp ${version_dir}/${BGmi_file} ${version_dir_old}/${BGmi_file}
    echo "${BGmi_version_new}" > ${version_dir}/${BGmi_file}
fi

BGmi_version_send=$(
if [ "${BGmi_version_new}" != "${BGmi_version_old}" ]; then
    echo "BGmi版本变动 | ${BGmi_version_old} --> ${BGmi_version_new} "
else
    echo "BGmi版本未变动 | 最新版本为${BGmi_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## linuxserver/docker-transmission

linuxserver_transmission_file=linuxserver_transmission_version

if [ ! -f ${version_dir}/${linuxserver_transmission_file} ]; then
    touch ${version_dir}/${linuxserver_transmission_file}
    echo "0.0.0" > ${version_dir}/${linuxserver_transmission_file}
fi

linuxserver_transmission_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/linuxserver/docker-transmission/tags | grep 'name' | cut -d\" -f4 | head -1)
linuxserver_transmission_version_old=$(cat $version_dir/${linuxserver_transmission_file} | head -n1)

if [ "${linuxserver_transmission_version_new}" != "${linuxserver_transmission_version_old}" ]; then
    if [ -f ${version_dir_old}/${linuxserver_transmission_file} ]; then
        rm -rf ${version_dir_old}/${linuxserver_transmission_file}
    fi
    cp ${version_dir}/${linuxserver_transmission_file} ${version_dir_old}/${linuxserver_transmission_file}
    echo "${linuxserver_transmission_version_new}" > ${version_dir}/${linuxserver_transmission_file}
fi

linuxserver_transmission_version_send=$(
if [ "${linuxserver_transmission_version_new}" != "${linuxserver_transmission_version_old}" ]; then
    echo "linuxserver/docker-transmission版本变动 | ${linuxserver_transmission_version_old} --> ${linuxserver_transmission_version_new} "
else
    echo "linuxserver/docker-transmission版本未变动 | 最新版本为${linuxserver_transmission_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## jxxghp/nas-tools

jxxghp_nas_tools_file=jxxghp_nas_tools_version

if [ ! -f ${version_dir}/${jxxghp_nas_tools_file} ]; then
    touch ${version_dir}/${jxxghp_nas_tools_file}
    echo "0.0.0" > ${version_dir}/${jxxghp_nas_tools_file}
fi

jxxghp_nas_tools_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/jxxghp/nas-tools/tags | grep 'name' | cut -d\" -f4 | head -1)
jxxghp_nas_tools_version_old=$(cat $version_dir/${jxxghp_nas_tools_file} | head -n1)

if [ "${jxxghp_nas_tools_version_new}" != "${jxxghp_nas_tools_version_old}" ]; then
    if [ -f ${version_dir_old}/${jxxghp_nas_tools_file} ]; then
        rm -rf ${version_dir_old}/${jxxghp_nas_tools_file}
    fi
    cp ${version_dir}/${jxxghp_nas_tools_file} ${version_dir_old}/${jxxghp_nas_tools_file}
    echo "${jxxghp_nas_tools_version_new}" > ${version_dir}/${jxxghp_nas_tools_file}
fi

jxxghp_nas_tools_version_send=$(
if [ "${jxxghp_nas_tools_version_new}" != "${jxxghp_nas_tools_version_old}" ]; then
    echo "jxxghp/nas-tools版本变动 | ${jxxghp_nas_tools_version_old} --> ${jxxghp_nas_tools_version_new} "
else
    echo "jxxghp/nas-tools版本未变动 | 最新版本为${jxxghp_nas_tools_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------

## allanpk716/ChineseSubFinder

allanpk716_ChineseSubFinder_file=allanpk716_ChineseSubFinder_version

if [ ! -f ${version_dir}/${allanpk716_ChineseSubFinder_file} ]; then
    touch ${version_dir}/${allanpk716_ChineseSubFinder_file}
    echo "0.0.0" > ${version_dir}/${allanpk716_ChineseSubFinder_file}
fi

allanpk716_ChineseSubFinder_version_new=$(wget --no-check-certificate -qO- https://api.github.com/repos/allanpk716/ChineseSubFinder/tags | grep 'name' | cut -d\" -f4 | head -1)
allanpk716_ChineseSubFinder_version_old=$(cat $version_dir/${allanpk716_ChineseSubFinder_file} | head -n1)

if [ "${allanpk716_ChineseSubFinder_version_new}" != "${allanpk716_ChineseSubFinder_version_old}" ]; then
    if [ -f ${version_dir_old}/${allanpk716_ChineseSubFinder_file} ]; then
        rm -rf ${version_dir_old}/${allanpk716_ChineseSubFinder_file}
    fi
    cp ${version_dir}/${allanpk716_ChineseSubFinder_file} ${version_dir_old}/${allanpk716_ChineseSubFinder_file}
    echo "${allanpk716_ChineseSubFinder_version_new}" > ${version_dir}/${allanpk716_ChineseSubFinder_file}
fi

allanpk716_ChineseSubFinder_version_send=$(
if [ "${allanpk716_ChineseSubFinder_version_new}" != "${allanpk716_ChineseSubFinder_version_old}" ]; then
    echo "allanpk716/ChineseSubFinder版本变动 | ${allanpk716_ChineseSubFinder_version_old} --> ${allanpk716_ChineseSubFinder_version_new} "
else
    echo "allanpk716/ChineseSubFinder版本未变动 | 最新版本为${allanpk716_ChineseSubFinder_version_new}"
fi
)

#------------------------------------------------------------------------------------------------------------------------------------------
# 通知发送
Text_Send=$(

date

echo

echo "${mayswind_AriaNg_version_send}"

echo "${c0re100_qBittorrent_ee_version_send}"

echo "${userdocs_qbittorrent_nox_static_version_send}"

echo "${icret_EasyImages2_0_version_send}"

echo "${BGmi_version_send}"

echo "${linuxserver_transmission_version_send}"

echo "${jxxghp_nas_tools_version_send}"

echo "${allanpk716_ChineseSubFinder_version_send}"

)

echo "${Text_Send}"

curl -s -k "https://api.telegram.org/bot${TGBOT_SEND_TOKEN}/sendMessage" \
	--data-urlencode "chat_id=${TGBOT_SEND_CHATID}" \
	--data-urlencode "text=${Text_Send}"
