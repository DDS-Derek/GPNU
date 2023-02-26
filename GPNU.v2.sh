#!/bin/bash

declare -A projects
declare -A projects_gitee

# 创建配置文件
if [ ! -d $GPNU_CONFIG_DIR ]; then
	mkdir -p $GPNU_CONFIG_DIR
fi
if [ ! -f ${GPNU_CONFIG_DIR}/config.sh ]; then
touch ${GPNU_CONFIG_DIR}/config.sh
cat > ${GPNU_CONFIG_DIR}/config.sh <<EOF
#!/bin/bash

TGBOT_SEND_CHATID=
TGBOT_SEND_TOKEN=

GITHUB_TOKEN=

INTERVAL=2h

projects=( 
  ["mayswind/AriaNg"]="0" 
  ["c0re100/qBittorrent-Enhanced-Edition"]="0" 
  ["userdocs/qbittorrent-nox-static"]="0" 
  ["icret/EasyImages2.0"]="0" 
  ["BGmi/BGmi"]="0" 
  ["linuxserver/docker-transmission"]="0" 
  ["jxxghp/nas-tools"]="0" 
  ["ChineseSubFinder/ChineseSubFinder"]="0" 
  ["sleikang/EmbyChineseNameSynchronous"]="0" 
  ["hectorqin/reader"]="0" 
  ["filebrowser/filebrowser"]="0" 
  ["stashapp/stash"]="0" 
)
projects_gitee=( 
  ["cym1102/nginxWebUI"]="0" 
)
EOF
echo "配置文件以生成，请配置完成后重新运行脚本"
exit
fi

# 获取配置文件配置
. ${GPNU_CONFIG_DIR}/config.sh

TOKEN="${GITHUB_TOKEN}"
TELEGRAM_BOT_TOKEN="${TGBOT_SEND_TOKEN}"
TELEGRAM_CHAT_ID="${TGBOT_SEND_CHATID}"

while true; do
  message=$(echo -e "$(date)\n")
  for project in "${!projects[@]}"; do
    tag=${projects[$project]}
    new_tag=$(curl -s -H "Authorization: token $TOKEN" "https://api.github.com/repos/${project}/releases/latest" | grep tag_name | cut -d\" -f4 | head -n 1)
    if [[ $new_tag != $tag ]]; then
    # 发现新的tag版本，发送通知
    message=$(echo -e "${message}\n🎉 ${project} 有新的tag版本: $tag --> ${new_tag}！")
    # 更新tag版本号
    projects[$project]=$new_tag
    fi
  done
  for project_gitee in "${!projects_gitee[@]}"; do
    tag=${projects_gitee[$project_gitee]}
    new_tag=$(curl -s "https://gitee.com/api/v5/repos/${project_gitee}/releases/latest" | grep tag_name | cut -d\" -f6 | head -n 1)
    if [[ $new_tag != $tag ]]; then
    # 发现新的tag版本，发送通知
    message=$(echo -e "${message}\n🎉 ${project_gitee} 有新的tag版本: $tag --> ${new_tag}！")
    # 更新tag版本号
    projects_gitee[$project_gitee]=$new_tag
    fi
  done
  # 输出message信息，方便排查问题
  message=$(echo -e "${message}\n更新情况如上！")
  echo -e "${message}"
  curl -s -k "https://api.telegram.org/bot${TELEGRAM_BOT_TOKEN}/sendMessage" \
    --data-urlencode "chat_id=${TELEGRAM_CHAT_ID}" \
    --data-urlencode "text=${message}"
  # 等待一段时间再进行下一次轮询
  sleep $INTERVAL
done
