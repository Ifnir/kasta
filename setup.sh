#!/usr/bin/env bash

# Install script for polybar and rofi

# Directories
DIR=`pwd`
FONTDIR="$HOME/.local/share/fonts"
POLYDIR="$HOME/.config/polybar"

# font
install_fonts()
{
    echo -e "\n[*] Installing fonts..."
    if [[ -d "$FONTDIR" ]]; then
	cp -rf $FONTDIR/fonts/* "$FONTDIR"
    else
	mkdir -p "$FONTDIR"
	cp -rf $DIR/fonts/* "$FONTDIR"
    fi
}

# theme

install_theme()
{
    if [[ -d "$POLYDIR" ]]; then
	echo -e "[*] Creating a backup of your polybar configs..."
	mv "$POLYBAR" "${POLYDIR}.old"
	{ mkdir -p "$POLYDIR"; cp -rf $DIR/$STYLEDIR/* "$POLYDIR"; }
    else
	{ mkdir -p "$POLYDIR"; cp -rf $DIR/$STYLEDIR/* "$POLYDIR"; }
    fi

    if [[ -f "$POLYDIR/launch.sh"  ]]; then
	echo -e "[*] Successfully installed...\n"
	exit 0
    else
	echo -e "[!] Failed to install...\n"
	exit 1
    fi
}

interface()
{
    clear
    cat <<-EOF
    [*] Install Polybar Theme...
    
    [*] Choose -
    [1] Install
    [2] Exit
EOF
    
    read -p "[?] Select Option : "

    if [[ $REPLY == "1" ]]; then
	echo -e "Installing..."
	STYLEDIR='styles'
	install_fonts
	install_theme
    elif [[ $REPLY == "2" ]]; then
	echo -e "Exiting the install wizard..."
	exit 0
    else
	echo -e "\n[!] Invalid Option.\n[!] Exiting...\n"
	exit 1
    fi
}

interface
