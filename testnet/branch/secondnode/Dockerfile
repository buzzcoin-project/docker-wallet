FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update 

RUN apt-get install -qy automake autoconf pkg-config libcurl4-openssl-dev libssl-dev libjansson-dev libgmp-dev make \
    g++ git build-essential libtool autotools-dev autoconf pkg-config libssl-dev libboost-all-dev libqrencode-dev \
    autoconf openssl libssl-dev libevent-dev libminiupnpc-dev software-properties-common

#RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
#RUN apt-get install -y net-tools

RUN git clone https://github.com/tpruvot/cpuminer-multi -b linux

RUN cd cpuminer-multi && ./build.sh

RUN apt-add-repository ppa:bitcoin/bitcoin

RUN apt-get update

RUN apt-get install -y libdb4.8-dev libdb4.8++-dev


RUN git clone https://github.com/buzzcoin-project/BUZZ.git

RUN cd BUZZ && git checkout stabilit && git pull

RUN cd BUZZ/src && \
    USE_UPNP=1 make -f makefile.unix

VOLUME ["/root/.buzzcoin"]

COPY buzzcoin.conf /root/.buzzcoin/

RUN chmod 600 /root/.buzzcoin/buzzcoin.conf && \ 
    chown root:root /root/.buzzcoin/buzzcoin.conf

COPY .bash_aliases /root/

COPY startnode.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/startnode.sh

RUN cp /root/BUZZ/src/buzzcoind /usr/local/bin/ && \
    cp /root/cpuminer-multi/cpuminer /usr/local/bin/ && \
    rm -rf /root/BUZZ && \
    rm -rf /root/cpuminer-multi

EXPOSE 20114
EXPOSE 20115

ENV LANG en_US.UTF-8

CMD ["/usr/local/bin/startnode.sh"]
