FROM centos:centos7



RUN yum update -y && \
    yum install -y curl   \
                   git  \
                   build-essential \
                   libtool \
zip \
unzip \
 snappy-devel \
 bz2 \
 zlib \
 zlib-devel \
 bzip2 \
 bzip2-devel \
 libzip-dev \
 libsnappy-dev \
 zlib1g \
 zlib1g-dev \
 golang \
 autoconf \
 gcc-c++ \
 make \
 gcc


 RUN mkdir -p /opt && \
     cd /opt &&\
     git clone https://github.com/google/protobuf.git && \
     cd /opt/protobuf && \
     git checkout 3.0.x && \
     ./autogen.sh && \
     ./configure --prefix=/usr && \
     make && \
     make check && \
     make install && \
     make clean  && rm -rf /opt/protobuf


RUN cd /opt && \
    git clone https://github.com/facebook/rocksdb.git && \
    cd rocksdb && \
    git checkout tags/v4.1  && \
    PORTABLE=1 make shared_lib  && \
    INSTALL_PATH=/usr/local make install-shared &&\
    ldconfig &&\
    make clean && rm -rf /opt/rocksdb
