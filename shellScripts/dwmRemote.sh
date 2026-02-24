#!/bin/sh

mv /usr/bin/dwm /usr/bin/dwm-temp
cd /home/sumer/dwm-remote && make clean install
mv /usr/bin/dwm /usr/bin/dwm-remote
mv /usr/bin/dwm-temp /usr/bin/dwm
