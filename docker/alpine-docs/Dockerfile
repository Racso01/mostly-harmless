FROM alpine:3.8

RUN apk add -U --no-cache man man-pages mdocml-apropos less less-doc
ENV PAGER less
RUN apk add -U --no-cache zfs-doc gptfdisk-doc mosh-doc \
    docker-doc nftables-doc ulogd-doc usb-modeswitch-doc
