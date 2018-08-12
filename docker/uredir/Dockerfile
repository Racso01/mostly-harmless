FROM buildpack-deps:stretch as builder

RUN git clone https://github.com/troglobit/libuev
RUN cd libuev && ./autogen.sh && ./configure && make -j5 && make install-strip && ldconfig
RUN git clone https://github.com/troglobit/uredir
RUN cd uredir && ./autogen.sh && ./configure --disable-shared && make -j5 && make install
RUN /usr/local/bin/uredir -v
RUN rm -rf libuev uredir

ENTRYPOINT ["/usr/local/bin/uredir"]
