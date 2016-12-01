
FROM openshift/base-centos7
MAINTAINER Joseph Moragrega <jmoragrega@snapgizmos.com>

COPY bin/gdrive /usr/local/bin/

RUN yum -y install mariadb

VOLUME /data/local
VOLUME /data/remote
VOLUME /data/secrets

