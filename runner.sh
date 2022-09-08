#!/bin/bash

touch /var/log/vasko.log

# Start logging in background
tail -f /var/log/vasko.log &

echo 'Generating crontab' >> /var/log/vasko.log
/opt/vasko/bin/python -u cron_generator.py vasko-cron

echo 'Installing crontab' >> /var/log/vasko.log
crontab -r
crontab vasko-cron
crontab -l >> /var/log/vasko.log

echo 'Starting crond' >> /var/log/vasko.log
# Start cron daemon in foreground
crond -f -l 2
