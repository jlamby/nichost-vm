FROM reubenbond/playframework2

ENV PATH $PATH:/opt/java/bin

# Copy the application files.
RUN git clone -b dev https://github.com/logscl/nicobot-chatlog.git /app/nicobot-chatlog

WORKDIR /app/nicobot-chatlog

# Compile the application and prepare it for staging
RUN play2 clean compile

# Start the application.
ENV PLAY_OPTS -Dhttp.port=80
EXPOSE 80

CMD play2 start < /dev/zero