# xboxdrv-udev-rules
xboxdrv udev-rules and configs for several USB controllers

## Rundown

I was tired of having to specify configurations for various controllers using xboxdrv. I wrote some udev rules and an xboxdrv wrapper. 
I currently only have the udev rules for the PS3 Hori Pad.

This script creates a service for systemd. If you don't have systemd you can probably write something that works for you.

You can use the udev rule for the PS3 Fighting Commander as a template. The supplemental information can be obtained through running
evtest on the associated event when plugging in the USB controller. This is located at /dev/input/


## Install

```bash
git clone https://github.com/phantom-voltage/xboxdrv-udev-rules
cd xboxdrv-udev-rules
./install.sh 
```
OR
manually place the config files and edit the wrapper accordingly.

## Hardware

Currently, I only have the udev info for the Hori Fighting Commander.

![Hori Fighting Commander](/img/hori_fighting_commander.jpg)

Seriously, this controller is amazing. I use it for all my 2d games.

I have xboxdrv configuration files for the Logitech Dual Action controller, but I don't have the udev
rules yet.


