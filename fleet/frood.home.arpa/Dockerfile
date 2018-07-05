FROM alpine

RUN apk add --no-cache alpine-sdk build-base apk-tools alpine-conf busybox fakeroot syslinux xorriso
RUN apk add --no-cache mtools dosfstools grub-efi
RUN adduser build -D -G abuild
RUN sudo -u build abuild-keygen -a
RUN git clone --depth=1 git://git.alpinelinux.org/aports
COPY mkimg.frood.sh aports/scripts/mkimg.frood.sh
COPY run.sh run.sh
CMD ["./run.sh"]
