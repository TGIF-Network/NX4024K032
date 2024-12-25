#!/bin/bash
############################################################
#   Set one mode Colors on Colors.ini                      #
#  						           #
#  						           #
#  VE3RD                                        2024-12-24 #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /

Mode="$1"
Val="$2"
SetNum=0

#sn=$(sed -nr "/^\['"Mode"']/ { :1 /^Set[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/Colors.ini)

sudo sed -i '/^\[/h;G;/'"$Mode"'/s/\(Set=\).*/\1'"$Val"'/m;P;d'  /etc/Colors.ini


sudo mount -o remount,ro /

