#!/bin/bash
############################################################
#  Get  Mode from /etc/mmdvmhost                           #
#  $1 1-6 Select Mode to get status of                     #
#                                                          #
#  Returns the status Enable=0 or 1                        #
#                                                          #
#  KF6S                                        09-01-2019  #
############################################################
set -o errexit
set -o pipefail

m1=$(sed -nr "/^\[D-Star]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m2=$(sed -nr "/^\[DMR]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m3=$(sed -nr "/^\[System Fusion]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m4=$(sed -nr "/^\[P25]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m5=$(sed -nr "/^\[NXDN]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m6=$(sed -nr "/^\[POCSAG]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m7=$(sed -nr "/^\[M17]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)



mt="$m1|$m2|$m3|$m4|$m5|$m6|$m7"
echo "$mt"
