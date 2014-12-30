FROM dockerfile/nodejs

RUN npm install -g forever
ADD run.sh /run.sh

WORKDIR /app

EXPOSE 8080

CMD "/run.sh"
