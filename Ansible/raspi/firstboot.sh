#!/bin/bash
sleep 2m
macadd=$( ip -brief add | awk '/UP/ {print $1}' | sort | head -1 )
if [ ! -z "${macadd}" ]
then
  macadd=$( sed 's/://g' /sys/class/net/${macadd}/address )
  sed "s/raspberrypi/${macadd}/g" -i /etc/hostname /etc/hosts
fi
/sbin/shutdown -r 5 "reboot in Five minutes"
