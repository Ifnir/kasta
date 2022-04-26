#!/usr/bin/env bash

DIR=$HOME/.config/

apps=(rofi polybar dunst)

for app in ${apps[@]}; do
  if ! hash $app &> /dev/null; then
    echo "$app is not installed..."
  else
    echo "$app is installed..."
  fi
done;

OSNAME=`lsb_release -a 2>/dev/null | grep "Distributor ID:" | awk '{print $3}'`
echo "$OSNAME"
