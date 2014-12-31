FROM tutum/apache-php

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

EXPOSE 80

WORKDIR /app
CMD ["/run.sh"]