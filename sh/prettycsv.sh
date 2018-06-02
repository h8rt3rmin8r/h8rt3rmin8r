#! /bin/bash
################################################################################
#  PRETTYCSV  #
###############
#
# Pretty-print CSV files in a bash terminal by passing the path to the desired
# file to 'prettycsv.'
#
# Created by h8rt3rmin8r on 20180601
# Email comments and questions to 161803398@email.tg
#
# Download the script at: https://pastebin.com/raw/ssPg4xA7
#
################################################################################

# Verify the user input is a CSV file
if [ ${1: -4} == ".csv" ]; then
    CSV="$1"
    # Output a beautified version of the indicated CSV
    sed 's/,,/, ,/g;s/,,/, ,/g' ${CSV} | column -s, -t
else
    CSV=.
fi

################################################################################
                                                   #                           #
                                                   #  "think outside the box"  #
                                                   #                           #
                                                   #    ($) ¯\_(ツ)_/¯ (฿)     #
                                                   #                           #
                                                   #############################
