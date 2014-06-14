FROM centos
MAINTAINER tmtk75

RUN yum update -y

RUN rpm -ivh http://ftp.riken.jp/Linux/fedora/epel/6/x86_64/epel-release-6-8.noarch.rpm
RUN yum install -y --enablerepo=epel nodejs npm

RUN npm install

