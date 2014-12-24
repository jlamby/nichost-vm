FROM ubuntu:trusty

RUN apt-get update              && \
    apt-get upgrade -y          && \
    apt-get install -y proftpd  && \
    apt-get clean
    
EXPOSE 21

CMD bash