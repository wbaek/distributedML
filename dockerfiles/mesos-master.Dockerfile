FROM ubuntu:16.04
MAINTAINER Woonhyuk Baek <wbaek.personal@gmail.com>

RUN apt-get update && \
    apt-get install -y tar wget git && \
    apt-get install -y openjdk-8-jdk && \
    apt-get install -y autoconf libtool && \
    apt-get -y install build-essential python-dev libcurl4-nss-dev libsasl2-dev libsasl2-modules maven libapr1-dev libsvn-dev zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /workspace/mesos && \
    cd /workspace/mesos && \
    wget http://www.apache.org/dist/mesos/1.1.0/mesos-1.1.0.tar.gz && \
    tar -zxf mesos-1.1.0.tar.gz && \
    cd mesos-1.1.0 && \
    ./bootstrap && \
    mkdir build && cd build && \
    ../configure && make -j 4 && make install && \
    rm -rf /workspace/mesos/mesos*

ENV LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
WORKDIR /workspace/mesos
ENTRYPOINT ["/usr/local/sbin/mesos-master", "--work_dir=/var/share/mesos/work_dir"]
