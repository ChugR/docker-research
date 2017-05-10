# Dockerfile to build a Fedora system with installed qpid-proton
# and qpid-dispatch.
#

FROM fedora:latest

# Chuck Rolke
LABEL maintainer "crolke@redhat.com"

USER root

# Install packages needed to build dispatch and proton,
# and to do some rudimentary debugging on the docker images.
RUN dnf -y update && dnf -y install \
    cmake \
    cyrus-sasl-devel \
    cyrus-sasl-gssapi \
    cyrus-sasl-md5 \
    cyrus-sasl-plain \
    doxygen \
    gcc \
    gcc-c++ \
    git \
    iftop \
    java-1.8.0-openjdk-devel \
    libuuid-devel \
    libuv \
    libuv-devel \
    libwebsockets \
    libwebsockets-devel \
    lsof \
    make \
    net-tools \
    openssl-devel \
    perl-devel \
    php-devel \
    python-devel \
    ruby-devel \
    swig \
    valgrind 

# Get, build, install qpid-proton
WORKDIR /main
RUN git clone https://github.com/apache/qpid-proton.git

WORKDIR /main/qpid-proton
RUN git pull

WORKDIR /main/qpid-proton/build
RUN cmake .. \
          -DSYSINSTALL_BINDINGS=ON \
          -DCMAKE_INSTALL_PREFIX=/usr \
          -DSYSINSTALL_PYTHON=ON \
    && make install

# Get, build, install qpid-dispatch
WORKDIR /main
RUN git clone https://github.com/apache/qpid-dispatch.git

WORKDIR /main/qpid-dispatch
RUN git pull

WORKDIR /main/qpid-dispatch/build
RUN cmake .. \
          -DCMAKE_INSTALL_PREFIX=/usr \
    && make install

# Install configuration scripts
COPY scripts/qdrouterd.conf      /etc/qpid-dispatch
COPY scripts/qdrouterd_sasl.conf /etc/sasl2/qdrouterd.conf

#
# Qdrouterd expects a sasldb file in /var/lib/qdrouterd.
# The sasldb file needs to be generated on the target host
# so that the file properly encodes the running image's
# variable host name.
RUN mkdir /var/lib/qdrouterd

# AMQP ports
# * The exact function of these ports is defined is file
#   scripts/qdrouterd.conf. 
# * Be sure your host and client firewalls allow these ports.
# * In DOCKER RUN you must specify which host ports are
#   the bridge targets of the image's exposed ports.
EXPOSE 5672
EXPOSE 5674

# Default container runs dispatch
COPY scripts/launch-qdrouterd.sh /launch-qdrouterd.sh
RUN  chmod +x                    /launch-qdrouterd.sh
CMD                            ["/launch-qdrouterd.sh"]
