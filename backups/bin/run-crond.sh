#!/bin/bash

# prepend application environment variables to crontab
env > /etc/environment

# Run cron deamon
# -m off : sending mail is off 
# tail makes the output to cron.log viewable with the $(docker logs container_id) command
/usr/sbin/crond $@

