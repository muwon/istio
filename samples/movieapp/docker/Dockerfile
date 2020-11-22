FROM nginx:1.12.2

RUN apt-get update && \
    apt-get install curl git gnupg2 -y

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get install nodejs -y

RUN cd /root && \
    git clone https://github.com/pmcfadin/cassandra-videodb-sample-schema.git

RUN apt-get install python-pip -y && \
    pip install cqlsh && \
    echo "alias cqlsh='cqlsh --cqlversion=3.4.4'" >> /root/.bashrc

RUN cd /root && \
    git clone https://github.com/jorgebay/killr-service.git && \
    cd killr-service && \
    npm install
 
COPY nginx-default.conf /etc/nginx/conf.d/default.conf
COPY server.js /root/killr-service/server.js
COPY run-app.sh /

CMD ["./run-app.sh"]
