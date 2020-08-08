FROM debian:stable
CMD ["bash"]
WORKDIR /tmp
RUN apt update && apt install -y pkg-config build-essential autoconf bison re2c libxml2-dev libsqlite3-dev wget
RUN mkdir -p /root/php8-beta1
RUN wget -c https://downloads.php.net/~carusogabriel/php-8.0.0beta1.tar.gz -O - | tar -xz
WORKDIR /tmp/php-8.0.0beta1
RUN ./configure --prefix=/root/php8-beta1
RUN make
RUN make install
RUN cp php.ini-development /root/php8-beta1/lib
RUN rm -rf /tmp/php-8.0.0beta1
ENV PATH="/root/php8-beta1/bin:${PATH}"
WORKDIR /