FROM ubuntu:trusty

RUN apt-get update              && \
    apt-get upgrade -y          && \
    apt-get install -y proftpd  && \
    apt-get clean

ADD proftpd.conf ftpd.passwd ftpd.group /etc/proftpd/

RUN chmod 640 /etc/proftpd/*ftpd*
RUN chown ftp /etc/proftpd/ftpd.*
RUN chgrp nogroup /etc/proftpd/ftpd.*

EXPOSE 21 6000 6001 6002 6003 6004 6005 6006 6007 6008 6009 6010

ENTRYPOINT ["proftpd"]
CMD ["-n"]