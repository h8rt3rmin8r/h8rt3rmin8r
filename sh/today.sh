#! /bin/bash
################################################################################
#  TODAY  #
###########
#
# Write today's date to "/var/www/html/date/index.html"
# Write yesterday's date to "/var/www/html/date/yesterday/index.html"
#
# Created by h8rt3rmin8r on 20180508
#
################################################################################

# Check or create necessary directory structure
mkdir -p /var/www/html/date
mkdir -p /var/www/html/date/y
mkdir -p /var/www/html/date/m
mkdir -p /var/www/html/date/d
mkdir -p /var/www/html/date/yesterday
mkdir -p /var/www/html/date/yesterday/y
mkdir -p /var/www/html/date/yesterday/m
mkdir -p /var/www/html/date/yesterday/d

# Check or create necessary HTML files
touch /var/www/html/date/index.html
touch /var/www/html/date/y/index.html
touch /var/www/html/date/m/index.html
touch /var/www/html/date/d/index.html
touch /var/www/html/date/yesterday/index.html
touch /var/www/html/date/yesterday/y/index.html
touch /var/www/html/date/yesterday/m/index.html
touch /var/www/html/date/yesterday/d/index.html

# Establish date variables
TODAY="`TZ=America/New_York date '+%Y%m%d' | head -c -1`"
TODAYY="`TZ=America/New_York date '+%Y' | head -c -1`"
TODAYM="`TZ=America/New_York date '+%m' | head -c -1`"
TODAYD="`TZ=America/New_York date '+%d' | head -c -1`"
echo 'scale=0;'${TODAY}'-1' | bc > yesterday.txt
YDAY="`cat yesterday.txt | head -c -1`"
YDAYY="`cat yesterday.txt | head -c -1`"
YDAYM="`cat yesterday.txt | head -c -1`"
YDAYD="`cat yesterday.txt | head -c -1`"

# Write the full date
echo ${TODAY} > /var/www/html/date/index.html
echo ${TODAYY} > /var/www/html/date/y/index.html
echo ${TODAYM} > /var/www/html/date/m/index.html
echo ${TODAYD} > /var/www/html/date/d/index.html

# Write yesterday's date
echo ${YDAY} > /var/www/html/date/yesterday/index.html
echo ${YDAYY} > /var/www/html/date/yesterday/y/index.html
echo ${YDAYM} > /var/www/html/date/yesterday/m/index.html
echo ${YDAYD} > /var/www/html/date/yesterday/d/index.html

# Clean up the local workspace
rm yesterday.txt

################################################################################
                                                 ###                         ###
                                                 ### "think outside the box" ###
                                                 ###                         ###
                                                 ###   ($) ¯\_(ツ)_/¯ (฿)    ###
                                                 ###                         ###
                                                 ###############################
