#! /bin/bash
################################################################################
#              ___.                 .__            .__        
#              \_ |__ _____    _____|  |__   _____ |__| ____  
#              | __ \\__  \  /  ___/  |  \ /     \|  |/    \ 
#              | \_\ \/ __ \_\___ \|   Y  \  Y Y  \  |   |  \
#              |___  (____  /____  >___|  /__|_|  /__|___|  /
#                  \/     \/     \/     \/      \/        \/ 
#
################################################################################
#------------------------------------------------------------------------------#
#
# SCRIPT NAME:      bashmin.sh
#
# DESCRIPTION:      Resize images and minify images, CSS, and JS with Bash
#
# USE:              Make this script executable with 'sudo chmod +x bashmin.sh'
#                   Then you can either run it directly (with './bashmin.sh') or
#                   you can place it into /usr/local/bin and invoke the script
#                   from any directory simply with 'bashmin.sh'
#
# RESOURCES:        pngcrush.com, img-resize.com, cssminifier.com,
#                   and javascript-minifier.com (by t.co/andychilton)
#                   Many thanks to @andychilton for maintaining these fantastic
#                   endpoints!
#
# MODIFIED DATE:    20181003
#
# SCRIPT AUTHOR:    William Thompson (for ResoNova.com)
#
# SOURCE CODE:      bit.ly/bashmin-sh
#
#------------------------------------------------------------------------------#
# VARIABLE ASSIGNMENTS

DT="`date '+%Y%m%d%H%M%S' | head -c -1`"

# FUNCTION DECLARATIONS

function help_bashmin() {
    # Print the bashmin help text
    echo
}

function inputstream() {
    # Write all incoming data into an array, "INST", to allow for both
    # interactive and piped inputs
    INST=""
    if [ -t 0 ]; then
        local IN=( $(echo -n "$@") )
    else
        local IN=( $(</dev/stdin) $(echo -n "$@") )
    fi
    export INST=( $(echo ${IN[@]}) )
    return
}

function n_tc() {
    # Colorize text outputs
    inputstream "$@"; echo -e "\e[95m${INST[@]}\e[39m"
}

function softcheck() {
    # Verify if a specific package or software is installed on the system
    if [[ "x$1" == "x" ]]; then
        echo "No package or software indicated!" | notify_err
        echo "Please try again." | notify_msg
    fi
    if "$1" --version >/dev/null 2>&1; then echo TRUE; else echo FALSE; fi
    return
}

function depends_check() {
    # Make sure necessary software packages are present
    if "$1" --version >/dev/null 2>&1; then echo TRUE; else echo FALSE; fi
    return
}

function depends() {
    # Core dependancy checking loop
    for i in ${DEPENDS[@]};
    do
        vb_out "${VB_03}$i"; sleep 0.5
        case $(depends_check "$i") in
            TRUE) vb_out "${VB_04}" ;;
            FALSE)
                vb_out "${VB_05}$i"
                DEPENDS_REQ+="$i"
                ;;
        esac; sleep 0.5
    done
    if [[ $(echo -n ${DEPENDS_REQ[@]}) =~ [A-Za-z0-9] ]];
    then
        vb_out "${VB_06}"
        echo "  ${DEPENDS_REQ[@]}"
        read -p "Would you like to install them? [y/n]: " -n 1 -r
        echo "" # insert new line
        if [[ $REPLY =~ ^[Yy]$ ]]
        then
            echo $(vb_out "Installing ${DEPENDS_REQ[@]}")" Please wait..."
            sudo apt-get update
            for i in ${DEPENDS_REQ[@]}; do sudo apt-get install -y $i; done
        else
            vb_out "${VB_07}"; exit 1
        fi
    fi
    return
}

function notify_err() {
    # Return input text with standard error message formatting
    inputstream "$@"
    if [[ "x${INST[@]}" == "x" ]]; then return; fi
    local NAME_ARR=( $(echo ${FUNCNAME[*]}) )
    local SENDER_NAME=${NAME_ARR[-1]}
    local MSG_ERR=$(echo "$(n_tc [${SENDER_NAME}]) ERROR: ")
    echo "${MSG_ERR}${INST[@]}"
    return
}

function notify_msg() {
    # System notifications and messages formatting funciton
    # Write all incoming data into an array, "INST" (Standalone version of 'inputstream')
    local INST=""
    if [ -t 0 ]; then
        local IN=( $(echo -n "$@") )
    else
        local IN=( $(</dev/stdin) $(echo -n "$@") )
    fi
    local INST=( $(echo ${IN[@]}) )

    if [[ "x${INST[@]}" == "x" ]]; then return; fi
    local NAME_ARR=( $(echo ${FUNCNAME[*]}) )
    local SENDER_NAME=${NAME_ARR[-1]}
    local MSG_ERR=$(echo "$(n_tc [${SENDER_NAME}]) ERROR: ")
    local MSG_OPS=$(echo "$(n_tc [${SENDER_NAME}]) ")
    # Common function output messages
    case "$1" in
        -1|--1) echo "${MSG_ERR}Unknown input parameters" ;;
        -2|--2) echo "${MSG_ERR}Too many inputs!" ;;
        -3|--3) echo "${MSG_ERR}Incorrectly formatted inputs!" ;;
        -4|--4) echo "${MSG_ERR}No input parameters found! Please try again." ;;
        -5|--5) echo "" ;;
        *|'') echo "${MSG_OPS}${INST[@]}" ;;
    esac
    return
}

# Filterpipe Validation Operators - Implement by checking for null outputs after piping inputs

# is a valid directory reference
function filterpipe_dir() {
    inputstream "$@"; if [[ -d ${INST[@]} ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# is a valid domain (with NO transfer protocol prepended)
filterpipe_dom() {
    inputstream "$@"; local DOM_TEST=$(echo -n ${INST[@]#*//})
    echo ${DOM_TEST} | grep --color=never -P '(?=^.{4,253}$)(^(?:[a-zA-Z](?:(?:[a-zA-Z0-9\-]){0,61}[a-zA-Z])?\.)+[a-zA-Z]{2,}$)'; return    
}
# is a valid file reference
function filterpipe_fil() {
    inputstream "$@"; if [[ -f ${INST[@]} ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains a parameter
function filterpipe_par() {
    inputstream "$@"; if [[ ${INST[@]} == -* ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains a valid transfer protocol
function filterpipe_ptc() {
    inputstream "$@"; if [[ ${INST[@],,} =~ ^https?://. ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains an intiger
function filterpipe_int() {
    inputstream "$@"; if [[ ${INST[@]} =~ ^-?[0-9]+$ ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# is a valid IP address
filterpipe_ipx() {
    inputstream "$@"; echo -n ${INST[@]} | grep --color=never -w "^[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}.[0-9]\{1,3\}$"; return
}
# contains floating point decimals
function filterpipe_flt() {
    inputstream "$@"; if [[ ${INST[@]} =~ ^-?[0-9]*[.,]?[0-9]*$ ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains scientific notation
function filterpipe_sci() {
    inputstream "$@"; if [[ ${INST[@]} =~ ^-?[0-9]*[.,]?[0-9]*[eE]-?[0-9]+$ ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains lowercase letters
function filterpipe_loc() {
    inputstream "$@"; if [[ ${INST[@]} == [[:lower:]] ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains uppercase letters
function filterpipe_upc() {
    inputstream "$@"; if [[ ${INST[@]} == [[:upper:]] ]]; then echo -n ${INST[@]}; else echo -n; fi; return
}
# contains numbers
function filterpipe_num() { 
    inputstream "$@"
    while true; do
        if [[ "${INST[@]}" =~ ^-?[0-9]+$ ]]; then echo -n ${INST[@]}; break
            elif [[ "${INST[@]}" =~ ^-?[0-9]*[.,]?[0-9]*$ ]]; then echo -n ${INST[@]}; break
            elif [[ "${INST[@]}" =~ ^-?[0-9]*[.,]?[0-9]*[eE]-?[0-9]+$ ]]; then echo -n ${INST[@]}; break
            else echo -n; break
        fi
    done
    return
}

#------------------------------------------------------------------------------#
# Minify CSS
curl -X POST -s --data-urlencode 'input=p { color : red; }' https://cssminifier.com/raw

# Minify a CSS file (e.g. style.css -> style.min.css)
curl -X POST -s --data-urlencode 'input@style.css' https://cssminifier.com/raw > style.min.css

#------------------------------------------------------------------------------#
# Minify JavaScript
curl -X POST -s --data-urlencode 'input=console.log( 1 );' https://javascript-minifier.com/raw

# Minify a JS file (e.g. ready.js -> ready.min.js)
curl -X POST -s --data-urlencode 'input@ready.js' https://javascript-minifier.com/raw > ready.min.js

#------------------------------------------------------------------------------#
# Resizing a JPG file (e.g. filename.jpg -> resized.jpg)
#
# Operations
#
#    fixedWidth     
#        required: 'width'
#    fixedHeight
#        required: 'height'
#    scale
#        required: 'scaledWidth' and 'scaledHeight'
#    stretch
#        required: 'stretchedWidth' and 'stretchedHeight'
#    letterbox
#        required: 'letterboxWidth', 'letterboxHeight' and 'letterboxColor'
#    percentage
#        required: 'percent'
#
# The 'op' parameter should be set to one of the following:
#
#    fixedWidth
#    fixedHeight
#    scale
#    stretch
#    letterbox
#    percentage
#
#------------------------------------------------------------------------------#

# Example 1
curl -X POST -s --form "op=fixedWidth&fixedWidth=200&input=@filename.jpg;type=image/jpg" http://img-resize.com/resize > resized.jpg

# Example 2
curl -X POST \
    -s \
    --form 'op=fixedWidth' \
    --form 'width=200' \
    --form 'input=@flowers.jpg;type=image/jpg' \
    https://img-resize.com/resize > flowers-200x150.jpg

#------------------------------------------------------------------------------#
################################################################################
                                                   #                           # 
                                                   #  "think outside the box"  # 
                                                   #                           # 
                                                   #     ($) ¯\_(ツ)_/¯ (฿)    # 
                                                   #                           # 
                                                   #############################
