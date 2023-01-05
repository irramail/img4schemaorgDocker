#!/bin/sh
ln -s /root/schema /var/www/html/schema

/usr/bin/redis-server /etc/redis/redis.conf &
sleep 1
#./redis2file.sh &

rm -Rf /var/www/html/*
cp -r ./html/* /var/www/html/
sed -i "s/www-data/root/" /etc/nginx/nginx.conf
cp -f $(pwd)/default /etc/nginx/sites-enabled/default
/usr/sbin/nginx -g 'daemon on; master_process on;' &

./img4schemaorg &
while :; do sleep 1; done;
