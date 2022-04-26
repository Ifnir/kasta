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

echo -e "\nYou are running $OSNAME, correct?\n"

install_apt()
{
  case $OSNAME in
    Ubuntu)
      echo -e "Amazon"
    ;;
    "Arch Linux" | Manjaro)
      echo -e "The One"
    ;;
    NixOs)
      echo -e "What is this"
    ;;
    *)
      echo -e "Unknown"
    ;;
  esac
}

interface()
{

 echo -e "[*] Would you like me to install the packages?\n"

  echo -e "[*] Choose -\n"
  echo -e "[1] Yes"
  echo -e "[2] No\n"


 read -p "[?] Select : "

 if [[ $REPLY == "1" ]]; then
  echo -e "Installing..."
  install_apt
 elif [[ $REPLY == "2" ]]; then
   clear
   echo -e "Goodbye"
   exit 1
 else
  clear
  echo -e "\n[!] Invalid Option."
  exit 1
 fi
}

interface
