# NX3224K024
The new screen upgrade for the 2.4 requires the user to do a manual copy of the new screen on the Pi. 
SSH into the Pi and issues these commands at the command prompt:

rpi-rw
sudo rm -r -f /home/pi-star/Nextion_Temp

sudo git clone https://github.com/EA7KDO/NX3224K024 /home/pi-star/Nextion_Temp

sudo cp /home/pi-star/Nextion_Temp/NX3224K024.tft /usr/local/etc/NX3224K024.tft

After completing these steps successfully, the user can use the Flash button on the Flash screen to flash the new ift to the screen.
Moving forward the user can reboot and do a standard Git, (wait two minutes) Copy (wait one  minute) & Flash procedure.