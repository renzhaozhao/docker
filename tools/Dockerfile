FROM ubuntu:14.04
MAINTAINER Jing Luo <luojing@wyunbank.com>

RUN apt-get update \
    && apt-get install -y git php5 php5-curl zsh

# install arc
RUN mkdir arc \
    && cd arc \
    && git clone https://github.com/phacility/libphutil.git \
    && git clone https://github.com/phacility/arcanist.git \
    && cd /

RUN ln -s /arc/arcanist/bin/arc /usr/local/bin/arc
# arc end

COPY .arcrc /root/
RUN chmod 600 /root/.arcrc
COPY .gitconfig /root/

WORKDIR /

CMD ["/bin/bash"]


