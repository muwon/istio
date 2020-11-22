#!/bin/bash -f

cqlsh --cqlversion=3.4.4 -k killrvideo moviecstar -e "SELECT * FROM users;"
if [ $? -ne 0 ]; then
    cqlsh --cqlversion=3.4.4 moviecstar -f /root/cassandra-videodb-sample-schema/videodb-schema.cql
    cqlsh --cqlversion=3.4.4 moviecstar -f /root/cassandra-videodb-sample-schema/videodb-inserts.cql
fi

#service nginx status
#if [ $? -ne 0 ]; then
#    service nginx start
#fi

cd /root/killr-service
node server
