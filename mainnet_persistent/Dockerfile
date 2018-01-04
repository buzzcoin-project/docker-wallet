FROM ubuntu:16.04

WORKDIR /root

RUN apt-get update && apt-get install -y wget
RUN apt-get install -y build-essential libtool autotools-dev autoconf pkg-config libssl-dev
RUN apt-get install -y libboost-all-dev
RUN apt-get install -y libqt5gui5 libqt5core5a libqt5dbus5 qttools5-dev qttools5-dev-tools libprotobuf-dev protobuf-compiler
RUN apt-get install -y libqrencode-dev autoconf openssl libssl-dev libevent-dev
RUN apt-get install -y libminiupnpc-dev
RUN apt-get install -y software-properties-common
RUN apt-add-repository ppa:bitcoin/bitcoin
RUN apt-get update
RUN apt-get install -y libdb4.8-dev libdb4.8++-dev


RUN wget https://github.com/buzzcoin-project/BUZZ/archive/win-2.1.tar.gz
RUN tar -zvxf win-2.1.tar.gz && \
    mv BUZZ-win-2.1 buzzcoin
COPY rpcrawtransaction.patch /root/
RUN patch /root/buzzcoin/src/rpcrawtransaction.cpp /root/rpcrawtransaction.patch
RUN cd buzzcoin/src/leveldb && \
    make && \
    make libleveldb.a libmemenv.a && \
    cd .. && \
    make -f makefile.unix

VOLUME ["/opt/buzzcoin"]

EXPOSE 25128

CMD ["/root/buzzcoin/bin/buzzcoind", "--conf=/opt/buzzcoin/buzzcoind.conf", "--printtoconsole"]
