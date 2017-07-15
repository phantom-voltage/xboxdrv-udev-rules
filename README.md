# xboxdrv-udev-rules
xboxdrv udev-rules and configs for several USB controllers

## Rundown

I was tired of having to specify configurations for various controllers using xboxdrv. I wrote some udev rules and an xboxdrv wrapper. 
I currently only have the udev rules for the Hori PS3 Fighting Commander and the Logitech Dual Action USB controllers.

This script creates a service for systemd. If you don't have systemd you can probably write something that works for you.

You can use the udev rule for the Hori Fighting Commander as a template. The supplemental information can be obtained through running lsusb.

## Why not use daemon mode?

From what I can see, daemon mode requires you specify some configurations per slot. I use certain controllers for certain games, so this method works better for me.

## Install

```bash
git clone https://github.com/phantom-voltage/xboxdrv-udev-rules
cd xboxdrv-udev-rules
./install.sh 
```
OR
manually place the config files and edit the wrapper accordingly.

## Hardware


![Hori Fighting Commander](/img/hori_fighting_commander.jpg)

Seriously, this controller is amazing. I use it for all my 2d games.

![Logitech Dual Action](/img/logitech_dual_action.jpg)

This controller is pretty cheap. You can often find them at thrift shops.


