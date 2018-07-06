#!/bin/sh
set -e -x

cd aports
git pull
apk -U upgrade
sudo -u build scripts/mkimage.sh \
    --tag 3.8f1 \
	--outdir /iso \
	--arch x86_64 \
	--repository http://dl-cdn.alpinelinux.org/alpine/v3.8/main \
	--repository http://dl-cdn.alpinelinux.org/alpine/v3.8/community \
	--profile frood
