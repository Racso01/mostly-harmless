# https://docs.sandstorm.io/en/latest/install/#option-6-using-sandstorm-within-docker

FROM buildpack-deps

RUN useradd --system --user-group sandstorm
VOLUME /opt/sandstorm
ADD run.sh /run.sh
ENTRYPOINT ["/run.sh"]
