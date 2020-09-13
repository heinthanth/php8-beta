FROM debian:latest
RUN apt update && apt install -y pkg-config build-essential autoconf bison curl re2c \
    libxml2-dev libsqlite3-dev libonig-dev libssl-dev libcurl4-openssl-dev libpq-dev libreadline-dev libzip-dev && \
    cd /tmp && \
    curl https://downloads.php.net/~carusogabriel/php-8.0.0beta3.tar.gz -O && \
    tar -xf php-8.0.0beta3.tar.gz && \
    cd php-8.0.0beta3 && \
    ./configure \
    --enable-mysqlnd \
    --with-pdo-mysql \
    --with-pdo-mysql=mysqlnd \
    --with-pdo-pgsql=/usr/bin/pg_config \
    --enable-bcmath \
    --enable-fpm \
    --with-fpm-user=www-data \
    --with-fpm-group=www-data \
    --enable-mbstring \
    --enable-phpdbg \
    --enable-shmop \
    --enable-sockets \
    --enable-sysvmsg \
    --enable-sysvsem \
    --enable-sysvshm \
    --with-zip \
    --with-zlib \
    --with-curl \
    --with-pear \
    --with-openssl \
    --enable-pcntl \
    --with-readline && \
    make -j$(nproc) && \
    make install && \
    cp php.ini-* /usr/local/lib && \
    mv /usr/local/lib/php.ini-development /usr/local/lib/php.ini && \
    cd /usr/local/etc/ && \
    mv php-fpm.conf.default php-fpm.conf && \
    sed 's/NONE\/etc\//etc\//' /usr/local/etc/php-fpm.conf && \
    mv php-fpm.d/www.conf.default php-fpm.d/www.conf && \
    rm -rf /tmp/* && \
    apt autoremove --purge -y pkg-config build-essential autoconf bison curl re2c && \
    apt autoremove && apt clean && \
    rm -rf /var/lib/apt/lists/* && rm -rf /var/cache/apt/*
CMD ["php", "-a"]