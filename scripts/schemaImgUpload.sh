#!/bin/sh

mv -f /home/p6/schema/schemaImg_1.jpg /tmp

counter=`redis-cli get schemaOrg | grep 'xn--80accgj5cwafgf.xn--p1ai' | wc -l`

if  [ "$counter" != "0" ]; then 
 scp /home/p6/schema/*.jpg bus:/home/k/kamel8/zhduavtobus.rf/public_html/wp-content/uploads/pics
fi

counter_urbrk=`redis-cli get schemaOrg | grep '24urbrk.ru' | wc -l`

if  [ "$counter_urbrk" != "0" ]; then
 scp /home/p6/schema/*.jpg urbrk:/home/b/borovinw/24urbrk.ru/public_html/wp-content/uploads/pics
fi

mv -f /tmp/schemaImg_1.jpg /home/p6/schema
