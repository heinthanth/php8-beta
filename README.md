# php8-docker

Docker build for PHP 8 beta

## HOW TO BUILD

``` shell
git clone https://github.com/heinthanth/php8-beta
cd php8-beta
docker build -t php8-beta1:minimal . 
docker run -ti php8-beta1:minimal /bin/bash
```