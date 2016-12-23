
FROM openshift/base-centos7
MAINTAINER Joseph Moragrega <jmoragrega@snapgizmos.com>

COPY bin/gdrive /usr/local/bin/
COPY bin/oc /usr/local/bin/
COPY bin/run-crond.sh /usr/local/bin/
RUN chmod a+x /usr/local/bin/run-crond.sh

RUN yum -y install mariadb
RUN yum -y install crontabs cronie vixie-cron
RUN echo "Searching for cron .. " && find / -name cron
RUN echo "Searching for crontab .. " && find / -name crontab
RUN rpm -qa | grep cron
RUN rpm -ql cronie

RUN ls -al /usr/local/bin/run-crond.sh
#USER default

VOLUME /data/persistent
VOLUME /data/remote
VOLUME /data/secrets
VOLUME /var/spool/cron

CMD /usr/local/bin/run-crond.sh -n

