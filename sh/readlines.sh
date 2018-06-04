#! /bin/bash
################################################################################
#  READLINES  #
###############
#
#  Read a number of lines from an indicated file, beginning at the first line.
#
#  Example: $ readlines 7 myText.txt
#
#  Created by h8rt3rmin8r on 20180601
#
#  Source Code: https://pastebin.com/raw/G0vXRh7Y
#
################################################################################
#  VARIABLES  #
###############

# Protect against un-caught errors and non-zero exit codes
set -e 
set -o pipefail

# Pre-requisite directory setup and checks
# Self-identity variables defined:
SELF_FILE="${0##*/}"
SELF_PATH="${0}"
SELF="${SELF_FILE%.*}"
# Basic date-time variables defined
TODAY="`date '+%Y%m%d' | head -c -1`"
NOW="`date '+%Y%m%d-%H%M%S' | head -c -1`"
# Core directory structure verified/created and defined:
mkdir -p ${HOME}/.software
mkdir -p ${HOME}/.software/${SELF}
mkdir -p ${HOME}/.software/${SELF}/logs
SCRIPT_HOME="${HOME}/.software/${SELF}"
LOGS_HOME="${SCRIPT_HOME}/logs"
touch ${LOGS_HOME}/${TODAY}.log
LOG="${LOGS_HOME}/${TODAY}.log"

# External references
GITHUB_RAW='https://raw.githubusercontent.com/'
PASTEBIN_RAW='https://pastebin.com/raw/'
CODE="${PASTEBIN_RAW}G0vXRh7Y"

################################################################################
#  FUNCTIONS  #
###############

# Log successful start of readlines
echo "${NOW} -- readlines started" >> ${LOG}

#------------------------------------------------------------------------------#
#   Use "!=" for comparing strings
#if [ $1 != "07[0-9]\{9,9\}" ]

#   Use "==" for lexical comparisons
#	Check if both inputs are blank
if [ "x$1" == "x"  ] && [ "x$2" == "x"  ];
then
    echo "Both variables are empty!"
    echo ""
    echo "Please enter two variables in the following order:"
    echo "   ${SELF_PATH} <NUMBER_OF_LINES_TO_READ> <TARGET_FILE>"
    echo ""
    exit 1
fi

#   Check if the first user input is blank ("")
#	Assign the first user input to variable 'NUM'
if [ "x$1" == "x"  ]; 
then
    echo "You must pass at least one variable to ${SELF}"
    echo ""
    echo "Please enter two variables in the following order:"
    echo "   ${SELF_PATH} <NUMBER_OF_LINES_TO_READ> <TARGET_FILE>"
    echo ""
    exit 1
else
    NUM="$1"
fi

#   Check if the second user input is blank
#   If the second input is not blank assign the second input to 'TARGET'.
if [ "x$2" == "x" ]; 
then
    echo "You must pass two variables to ${SELF}"
    echo ""
    echo "Please enter two variables in the following order:"
    echo "   ${SELF_PATH} <NUMBER_OF_LINES_TO_READ> <TARGET_FILE>"
    echo ""
    exit 1
else
    TARGET="$2"
fi

#   Check if there exists a third user input
#   If there is a third input '$3', then kill the script
if [ "x$3" != "x"  ];
then
    echo "You can't pass three parameters to ${SELF}!"
    echo ""
    echo "Please enter two variables in the following order:"
    echo "   ${SELF_PATH} <NUMBER_OF_LINES_TO_READ> <TARGET_FILE>"
    echo ""
    exit 1
fi

#------------------------------------------------------------------------------#
# Loop through a range of lines
head -q -n ${NUM} ${TARGET} 2>> ${LOG}

# Log successful completion and exit
# Uncomment the following line to enable completion logging
#echo "${NOW} -- readlines completed successfully" >> ${LOG}

################################################################################
                                                   #                           #
                                                   #  "think outside the box"  #
                                                   #                           #
                                                   #    ($) ¯\_(ツ)_/¯ (฿)     #
                                                   #                           #
                                                   #############################
