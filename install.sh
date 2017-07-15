#!/bin/bash

echo "This script requires sudo privileges. Please understand what this \\
      script does before executing it.\n"

echo "Copying xboxdrv configuration files\n"
sudo cp -r xboxdrv /etc/xboxdrv

echo "Copying udev rules\n"
sudo cp udev/* /etc/udev/rules.d/

echo "Copying systemd services\n"
sudo cp systemd/* /etc/systemd/system/

echo "Copying wrapper script\n"
sudo cp bin/xboxdrv_connect.sh /usr/bin/xboxdrv_connect.sh

echo "Reloading udev rules\n"
sudo udevadm control --reload-rules && sudo udevadm trigger

