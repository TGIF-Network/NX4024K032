#!/bin/bash
############################################################
#  Get  Mode Hang Times from /etc/mmdvmhost                #
#                                                          #
#                                                          #
#  VE3RD                                       2024-12-23  #
############################################################
set -o errexit
set -o pipefail

m1=$(sed -nr "/^\[D-Star]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m2=$(sed -nr "/^\[D-Star Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m3=$(sed -nr "/^\[DMR]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m4=$(sed -nr "/^\[DMR Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m5=$(sed -nr "/^\[System Fusion]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m6=$(sed -nr "/^\[System Fusion Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m7=$(sed -nr "/^\[NXDN]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m8=$(sed -nr "/^\[NXDN Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m9=$(sed -nr "/^\[P25]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m10=$(sed -nr "/^\[P25 Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m11=$(sed -nr "/^\[M17]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
m12=$(sed -nr "/^\[M17 Network]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)



mt="$m1|$m2|$m3|$m4|$m5|$m6|$m7|$m8|$m9|$m10|$m11|$m12"
echo "$mt"

