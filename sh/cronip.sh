##################
###   CRONIP   ###
##################

# -----------------------------------------------------------------------------------

# Script Source: http://h8rt3rmin8r.com/sh/cronip.sh
# ReadMe Source: http://h8rt3rmin8r.com/sh/cronip.txt
# Terminal Clone: curl https://pastebin.com/raw/SestReQb && echo '  '
# Credits: h8rt3rmin8r
# Email: 161803398@email.tg
# PGP Key: http://h8rt3rmin8r.com
# Updated: 20171006-0025

# -----------------------------------------------------------------------------------

# DESCRIPTION OF ESSENTIAL FUNCTIONS:
# NOTE: ALL FUNCTIONS ARE PERFORMED ONE TIME EVERY HOUR OF THE DAY

# Fetch system's public IP address, current user, and date/time and append it to:
# ~/.CRON/cronip.log
# Fetch system's public IP address and date/time and append it to:
# ~/.CRON/datip.log
# Fetch system's public IP address and append it to:
# ~/.CRON/ip.log
# Fetch system's public IP address and overwrite it onto:
# ~/.CRON/lastip.html

# -----------------------------------------------------------------------------------

# DEPENDS

# cron
# crontab
# date
# whoami
# curl
# notify-send
# html2text
# xmlstarlet

# -----------------------------------------------------------------------------------

# CRONTAB CONFIGURATIONS
# View current cron configurations with the crontab tool with 'crontab -l'
# NOTE: You are likely to not have any current cron configurations if this is your
# first time creating one.
# Configure cron with the crontab tool with 'crontab -e'
# Add the following two lines into the crontab file and save your changes:

# 0 * * * * ~/.CRON/cronip.sh
# @reboot ~/.CRON/cronip.sh

# Then navigate to your home directory with 'cd'
# Make the '.CRON' directory with 'mkdir .CRON'
# Move into that new file and use a text editor to create a shell script with the
# following lines of code:
# -----------------------------------------------------------------------------------

# CRONIP.SH SCRIPT:

#! /bin/bash
# Log the initiation of the script into the cronip.log file
echo 'CRONIP: starting fetch' >> ~/.CRON/cronip.log

# Record the current date and time into the cronip.log file
echo 'DATE {'`date`'}' >> ~/.CRON/cronip.log

# Record the name of the current user into the cronip.log file
echo 'USER {'`whoami`'}' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server
# and record it into the cronip.log file
echo 'PUBLIC_IP {'`curl -sS https://domains.google.com/checkip`'}' >> ~/.CRON/cronip.log

# Fetch the system Geolocation IP data and record the data into
# the cronip.log file
echo 'GEO_IP_COUNTRY {' `curl -sS 'http://ip-api.com/csv/?fields=1'` '}' >> ~/.CRON/cronip.log
echo 'GEO_IP_LOCAL {' `curl -sS 'http://ip-api.com/csv/?fields=20'` '}' >> ~/.CRON/cronip.log

# Check if proxy is detected and record the results in the cronip.log
echo 'PROXY_DETECTED {' `curl -sS 'http://ip-api.com/csv/?fields=131072'` '}' >> ~/.CRON/cronip.log

# Record the current date and time into the dateip.log file
echo '(' `date` ')' >> ~/.CRON/dateip.log
echo 'CRONIP: date logged into dateip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server
# and record it into the dateip.log file
echo `curl -sS https://domains.google.com/checkip` >> ~/.CRON/dateip.log
echo '-----------------------------------------------------' >> ~/.CRON/dateip.log
echo 'CRONIP: IP logged into dateip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address via an out-of-network server
# and record it into the ip.log file
echo `curl -sS https://domains.google.com/checkip` >> ~/.CRON/ip.log
echo 'CRONIP: IP logged into ip.log' >> ~/.CRON/cronip.log

# Fetch the system IP address from the Google Domains server
# and overwrite it onto the lastip.html file
echo 'CRONIP last fetch ('`date`') -- '`curl -sS https://domains.google.com/checkip` > lastip.html
echo 'CRONIP: IP updated in lastip.html' >> ~/.CRON/cronip.log

# Push notification to desktop
notify-send "CRONIP" "FETCH COMPLETE: `date`"
echo 'CRONIP: notification sent to desktop' >> ~/.CRON/cronip.log

# Record the date and time of successful completion into the cronip.log file
echo 'CRONIP: fetch complete -- '`date` >> ~/.CRON/cronip.log
echo '-----------------------------------------------------' >> ~/.CRON/cronip.log

# -----------------------------------------------------------------------------------

###################################
###                             ###
###     ($) ¯\_(ツ)_/¯ (฿)      ###
###                             ###
###   "think outside the box"   ###
###                             ###
###################################
