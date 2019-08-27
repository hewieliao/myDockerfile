##基础镜像
FROM centos:latest
##维护者
MAINTAINER HewieLiao
##添加官nginx方yum源
ADD nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum-config-manager --enable nginx-mainline
##yum安装nginx
RUN yum -y install nginx unzip
##更换配置文件
ADD default.conf /etc/nginx/conf.d/default.conf
##添加可道云的源码包并解压到nginx的目录
#COPY kodexplorer4.40.zip /usr/share/nginx/html/
#WORKDIR /usr/share/nginx/html/
#RUN unzip kodexplorer4.40.zip
##清理yum缓存
RUN yum clean all
##暴露80端口
EXPOSE 80
##启动容器时启动nginx
CMD ["/usr/sbin/nginx","-g","daemon off;"]