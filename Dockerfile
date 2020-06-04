FROM ubuntu:18.04

RUN apt-get update && \
    apt-get -y install ca-certificates wget ocl-icd-libopencl1 netbase openssl tor torsocks && \
    apt-get -y autoremove && \
    apt-get clean

WORKDIR /root

RUN wget --no-check-certificate -q https://minergate.com/download/xfast-ubuntu-cli/1.6 -O minergate-cli.deb

RUN dpkg -i minergate-cli.deb 2>&1;return 0
RUN rm minergate-cli.deb

COPY launch.sh .
RUN chmod +x launch.sh

ENTRYPOINT ["bash","launch.sh"]

