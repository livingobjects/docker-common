#!/bin/sh

set -e

apk add alpine-sdk git
mkdir -p /var/cache/distfiles
adduser -D packager
addgroup packager abuild
chgrp abuild /var/cache/distfiles
chmod g+w /var/cache/distfiles && \
echo "packager    ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

su packager <<'EOF'
abuild-keygen -a -i && \
sudo chown packager:packager ~/.abuild/ && \
git clone git://dev.alpinelinux.org/aports /home/packager/aports && \
git -C /home/packager/aports checkout 372b38ff6d224156d67ef419b0f4e28a8ae538f6 && \
cd /home/packager/aports/main/nginx/ && \
cp /home/packager/APKBUILD APKBUILD && \
abuild -c -r -P /home/packager/target
EOF

cd /home/packager/target/main/x86_64/

apk add nginx-1.8.1-r0.apk
apk del alpine-sdk git
rm -rf /var/cache/apk/* /home/packager/aports /home/packager/target
