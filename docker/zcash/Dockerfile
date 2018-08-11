FROM debian:stretch
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y && apt-get install -y apt-transport-https
RUN apt-get update -y && apt-get install -y wget gnupg
RUN wget -qO - https://apt.z.cash/zcash.asc | apt-key add -
RUN echo "deb [arch=amd64] https://apt.z.cash/ jessie main" > /etc/apt/sources.list.d/zcash.list
RUN apt-get update -y && apt-get install -y zcash

RUN useradd --user-group --system --create-home --shell /bin/bash zcash
USER zcash

RUN zcash-fetch-params

RUN echo "addnode=mainnet.z.cash" > /home/zcash/zcash.conf
RUN mkdir /home/zcash/zcash-data
VOLUME /home/zcash/zcash-data

ENTRYPOINT ["/usr/bin/zcashd", "-conf=/home/zcash/zcash.conf", "-datadir=/home/zcash/zcash-data"]
