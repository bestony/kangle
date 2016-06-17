#!/bin/bash
echo 'Docker Init....';
sed -i "s:kangle:$KANGLEPASS:g" /vhs/kangle/etc/config.xml;
/vhs/kangle/bin/kangle;
curl 127.0.0.1;
echo 'Init Done';
tail -f /vhs/kangle/var/access.log;

