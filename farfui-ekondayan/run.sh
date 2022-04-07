#!/bin/bash

VERSION=18.0.2.314
USER=farfui
HOSTNAME='3cxgg.3cx.sc'

docker run \
        -d \
        --name 3cx \
        --hostname ${HOSTNAME} \
        --network host \
        --restart unless-stopped \
        -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
        -v 3cx_backup:/srv/backup \
        -v 3cx_recordings:/srv/recordings \
        -v 3cx_log:/var/log \
        --cap-add SYS_ADMIN \
        --cap-add NET_ADMIN \
        ${USER}/3cx:${VERSION}

docker exec 3cx timedatectl set-timezone Africa/Johannesburg
docker cp 3CXWebWizard 3cx:/usr/sbin/.
docker exec -it 3cx chmod +x /usr/sbin/3CXWebWizard
docker exec -it 3cx 3CXWebWizard