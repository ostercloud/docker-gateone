FROM hansd/base-14.04
MAINTAINER Hans Donner <hans.donner@pobox.com>

# install required packages
# - for tornado: gcc build-essential python-dev
#
RUN apt-get install -y \
       git python python-pip \
       gcc build-essential python-dev \
       python-tornado \
       python-kerberos \
       python-html5lib ;\


# get latest source from github and install
#
RUN git clone https://github.com/liftoff/GateOne.git gateone; \
    cd gateone; python setup.py install

RUN useradd student -p ch@nGeme!
VOLUME /etc/gateone

EXPOSE 443

CMD gateone --auth=pam
