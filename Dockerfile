FROM ubuntu:12.04
MAINTAINER Hans Donner <hans.donner@pobox.com>

ENV DEBIAN_FRONTEND noninteractive

# everything up to date
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list && \
RUN apt-get update && \
    apt-get upgrade -y

RUN apt-get install -y git python python-pip

RUN apt-get install -y gcc build-essential python-dev && \
    pip install tornado 
#pyopenssl

RUN pip install html5lib

RUN git clone https://github.com/liftoff/GateOne.git gateone && \
    cd gateone && \
    python setup.py install

VOLUME /etc/gateone

EXPOSE 443

CMD gateone
