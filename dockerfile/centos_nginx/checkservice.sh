#!/bin/bash
function check(){
  a=`docker ps -f status=exited |grep php |wc -l`
  if [ "$a" == "0" ];then
      echo "`date +%T` PHP服务已启动" > /dev/null
  else
      docker rm -f php
      docker run -d -p 9091:9000 -v /data/www:/usr/share/nginx/html --name php centos_php:v1.0
  fi
  b=`docker ps -f status=exited |grep nginx |wc -l`
  if [ "$b" == "0" ];then
      echo "`date +%T` nginx服务已启动" > /dev/null
  else
      docker rm -f nginx
      docker run -d -p 9092:80 -v /data/www:/usr/share/nginx/html --link php:php --name nginx kodnginx:v1.2
  fi
}
for((;;)){
  check
  sleep 1
}