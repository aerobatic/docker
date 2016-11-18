#!/bin/sh
set -e

# chown redis:redis /var/lib/redis
# Start redis
/usr/bin/redis-server /etc/redis/redis.conf

# Start dynamodb-local
# nohup bash -c "java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory -port 8000 2>&1" &
(cd /var/dynamodb-local; nohup bash -c "java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory -port 8000 2>&1" &)
sleep "10s"
cat /home/node/nohup.out
