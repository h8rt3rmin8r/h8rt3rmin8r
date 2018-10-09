#! /bin/bash
################################################################################
#
#    i-cryptohaze.sh
#    Install Cryptohaze, the GPU rainbow table cracking software
#    Assembled by h8rt3rmin8r on 20181009 for ResoNova (resonova.com)
#
#    Cryptohaze project website: http://bit.ly/cryptohaze-website
#    Read the user manual at http://bit.ly/cryptohaze-manual
#
#    USAGE:
#
#      Save this script locally as "i-cryptohaze.sh" and make it executable:
#        sudo chmod +x i-cryptohaze.sh
#
#      Run the script with 'sudo' in the following manner:
#        sudo ./i-cryptohaze.sh
#
#      This script can be run without verbosity with the following:
#        sudo ./i-cryptohaze.sh --silent
#
#    LICENSE:
#
#      Copyright 2018 ResoNova International Consulting, LLC
#
#      Licensed under the Apache License, Version 2.0 (the "License");
#      you may not use this file except in compliance with the License.
#      You may obtain a copy of the License at
#
#          http://www.apache.org/licenses/LICENSE-2.0
#
#      Unless required by applicable law or agreed to in writing, software
#      distributed under the License is distributed on an "AS IS" BASIS,
#      WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#      See the License for the specific language governing permissions and
#      limitations under the License.
#
################################################################################

# Variable assignments
SOURCE_01="http://bit.ly/cryptohaze"
SOURCE_02="http://bit.ly/single-charset"
SOURCE_03="http://bit.ly/test-hashes"
DIR_01="/opt/cryptohaze/"
DIR_02="${DIR_01}test_hashes/"
FIL_01="${DIR_01}test-hashes.txt"
FIL_02="${DIR_02}Hashes-SHA1-Full.txt"
FIL_03="${DIR_01}single_charset"
DEPENDS=( "curl" "dos2unix" "wget" )
DEPENDS_REQ=""
VB_00="Beginning installation of CRYPTOHAZE. Please wait..."
VB_01="Downloading core software (17.8 MB). Please wait..."
VB_02="Fetching single_charset"
VB_03="Checking for software package: "
VB_04="GOOD - Required package found!"
VB_05="ERR: Missing required package: "
VB_06="The following packages are required but are not installed on your system: "
VB_07="Aborting installation process"
VB_08="Root access confirmed"
VB_09="You must have root access to use this script! Try again with 'sudo'"
VB_10="Download COMPLETE!"
VB_11="Extracting archive contents directory '/opt/cryptohaze'. Please wait..."
VB_12="Setting up CRYPTOHAZE demo"
VB_13="Exiting installation script."
VB_14="Installation of CRYPTOHAZE has completed successfully!"
VB_15="You can run a test of the system at any time with the following: "
VB_16="cd /opt/cryptohaze"
VB_17="./Cryptohaze-Multiforcer -f "
VB_18=" \ "
VB_19A="    -h SHA1 -c single_charset"
VB_19B=" --threads 512 --blocks 512 -m 500"
VB_19="${VB_19A}${VB_19B}"
VB_20="####################"
VB_21="${VB_20}${VB_20}${VB_20}${VB_20}"
VB_22="--------------------"
VB_23="${VB_22}${VB_22}${VB_22}${VB_22}"
VB_24="Read the Cryptohaze user manual at bit.ly/cryptohaze-manual"

function vb_out() {
    # V_X function
    echo "[$0] $@"; return
}

function root_check() {
    # Verify root access
    uid=$(id -u $USERNAME)
    if [ "$uid" == "0" ]; then vb_out "${VB_08}"; else vb_out "${VB_09}"; exit 1; fi
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

function dl_cryptohaze() {
    # Download the source files for Cryptohaze
    vb_out "${VB_01}"; sleep 0.8
    wget ${SOURCE_01} \
        -q --show-progress --progress=dot:mega -O cryptohaze.tar.bz2
    echo; echo # insert new lines
    vb_out "${VB_10}"; sleep 0.5
    return
}

function setup_cryptohaze() {
    # Setup function for the downloaded Cryptohaze files
    vb_out "${VB_11}"; sleep 0.5
    tar -xjf cryptohaze.tar.bz2
    rm cryptohaze.tar.bz2
    sudo rm -rf ${DIR_01} &>/dev/null
    sudo mkdir -p ${DIR_01}
    sudo mv Cryptohaze-Linux/* ${DIR_01}
    sudo rm -rf Cryptohaze-Linux/
    # Cryptohaze demo setup
    vb_out "${VB_12}"; sleep 0.5
    sudo touch ${FIL_03}
    sudo curl -s -L ${SOURCE_02} | dos2unix > ${FIL_03}
    return
}

function test_cryptohaze() {
    # Run a simple test of the newly installed Cryptohaze system
    read -p "Would you like to perform a test run? [y/n]: " -n 1 -r
    echo # insert new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        echo "${VB_23}"
        cd ${DIR_01}
        sudo touch ${FIL_01}
        sudo curl -s -L ${SOURCE_03} | dos2unix > ${FIL_01}
        ./Cryptohaze-Multiforcer -h SHA1 -f ${FIL_01} \
            -c single_charset --threads 512 --blocks 512 -m 500
        echo "${VB_23}"
    fi
    vb_out "${VB_15}"; echo; echo "${VB_21}"
    echo "${VB_16}"; echo "${VB_17}${FIL_02}${VB_18}"; echo "${VB_19}"
    echo "${VB_21}"; echo
    sleep 0.8; return
}

# V_X check
if [[ "$@" =~ "-q" || "$@" =~ "--quiet" || "$@" =~ "-s" || "$@" =~ "--silent" ]];
    then V_X="/dev/null"; else V_X="/dev/stdout"; fi

# Perform installation functions
vb_out "${VB_00}"; sleep 0.8
root_check &>${V_X}
depends &>${V_X}
dl_cryptohaze &>${V_X}
setup_cryptohaze &>${V_X}
vb_out "${VB_14}"

# Offer to perform a test-run if installing verbosely
if [[ $(echo -n ${V_X}) == "/dev/stdout" ]]; then test_cryptohaze; fi

# Exit the installation script
vb_out "${VB_24}" &>${V_X}
vb_out "${VB_13}" &>${V_X}

################################################################################
                                                   #                           # 
                                                   #  "think outside the box"  # 
                                                   #                           # 
                                                   #     ($) ¯\_(ツ)_/¯ (฿)    # 
                                                   #                           # 
                                                   #############################
