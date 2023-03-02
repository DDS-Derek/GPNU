# GPNU
GitHub & Gitee project updates TeleGram notification script

```bash
docker run -d \
    --name gpnu \
    -v ./config:/config \
    -e TZ=Asia/Shanghai \
    -p 18081:80 \
    ddsderek/gpnu:latest
```

```yaml
version: '3.3'
services:
    gpnu:
        container_name: gpnu
        volumes:
            - './config:/config'
        environment:
            - TZ=Asia/Shanghai
        ports:
            - '18081:80'
        image: 'ddsderek/gpnu:latest'
```