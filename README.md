# php8-docker

Docker build for PHP 8 beta

## HOW TO BUILD

``` shell
git clone https://github.com/heinthanth/php8-beta
cd php8-beta

# for php-fpm
docker build -t php8:fpm -f php-fpm/Dockerfile

# for php
docker build -t php8 -f php/Dockerfile
```
