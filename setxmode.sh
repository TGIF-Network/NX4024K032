#!/bin/bash
############################################################
#  Change Vross Mode in /etc/mmdvmhost                     #
#  Also enable corresponding network                       #
#  VE3RD                                        2024-12-22 #
############################################################
set -o errexit
set -o pipefail
# Check all six modes and set each one to either 0 or 1

if [ -z "$1" ]; then
        exit
        else
        if [ "$1" = 1 ]; then sudo sed -i '/\[Enable\]/!b;n;cEnable='"$2"'' /etc/dr2ysf
        fi

        if [ "$1" = 2 ]; then sudo sed -i '/\[Enable\]/!b;n;cEnable='"$2"'' /etc/dmr2nxdn
        fi

        if [ "$1" = 3 ]; then sudo sed -i '/\[Enable\]/!b;n;cEnable='"$2"'' /etc/ysf2dmr
        fi

        if [ "$1" = 4 ]; then sudo sed -i '/\[Enable\]/!b;n;cEnable='"$2"'' /etc/ysf2nxdn
        fi

        if [ "$1" = 5 ]; then sudo sed -i '/\[Enable\]/!b;n;cEnable='"$2"'' /etc/ysf2p25
        fi
fi;
