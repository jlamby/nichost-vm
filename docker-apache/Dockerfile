FROM tutum/apache-php
MAINTAINER Julien Lamby

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80
EXPOSE 433

WORKDIR /app
CMD ["/run.sh"]