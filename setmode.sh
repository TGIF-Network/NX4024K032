#!/bin/bash
############################################################
#  Change Mode in /etc/mmdvmhost                           #
#  $1 1-6 Select Mode to change  $2 enable= 0 or 1         #
#  Also enable corresponding network                       #
#  VE3RD                                        2024-12-22 #
############################################################
set -o errexit
set -o pipefail
# Check all six modes and set each one to either 0 or 1
sudo mount -o remount,rw /

		sudo sed -i '/\[D-Star\]/!b;n;cEnable='"$1"'' /etc/mmdvmhost
           	sudo sed -i '/\[D-Star Network\]/!b;n;cEnable='"$1"'' /etc/mmdvmhost

		sudo sed -i '/\[DMR\]/!b;n;cEnable='"$2"'' /etc/mmdvmhost
          	sudo sed -i '/\[DMR Network\]/!b;n;cEnable='"$2"'' /etc/mmdvmhost

		sudo sed -i '/\[System Fusion\]/!b;n;cEnable='"$3"'' /etc/mmdvmhost
     		sudo sed -i '/\[System Fusion Network\]/!b;n;cEnable='"$3"'' /etc/mmdvmhost

		sudo sed -i '/\[NXDN\]/!b;n;cEnable='"$4"'' /etc/mmdvmhost
      		sudo sed -i '/\[NXDN Network\]/!b;n;cEnable='"$4"'' /etc/mmdvmhost

		sudo sed -i '/\[P25\]/!b;n;cEnable='"$5"'' /etc/mmdvmhost
         	sudo sed -i '/\[P25 Network\]/!b;n;cEnable='"$5"'' /etc/mmdvmhost

		sudo sed -i '/\[POCSAG\]/!b;n;cEnable='"$6"'' /etc/mmdvmhost
                sudo sed -i '/\[POCSAG Network\]/!b;n;cEnable='"$6"'' /etc/mmdvmhost

		sudo sed -i '/\[M17\]/!b;n;cEnable='"$7"'' /etc/mmdvmhost
                sudo sed -i '/\[M17 Network\]/!b;n;cEnable='"$7"'' /etc/mmdvmhost

#		mmdvmhost.system restart
		systemctl restart mmdvmhost.service
