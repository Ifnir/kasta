#!/usr/bin/env bash

# Install script for polybar and rofi

# Directories
DIR=`pwd`
FONTDIR="$HOME/.local/share/fonts"
POLYDIR="$HOME/.config/polybar"
DUNSTDIR="$HOME/.config/dunst"

# font
install_fonts()
{
    echo -e "\n[*] Installing fonts..."
    if [[ -d "$FONTDIR" ]]; then
	cp -rf $DIR/fonts/* "$FONTDIR"
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
	mv "${POLYBAR}"/* "${POLYDIR}.old"
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

install_dunst() 
{
    if [[ -d "$DUNSTDIR" ]]; then
    echo -e "[*] Creating a backup of your dunst config..."
    mv "${DUNSTDIR}"/* "${DUNSTDIR}.old"
    { mkdir -p "$DUNSTDIR"; cp -rf $DIR/dunst/* "$DUNSTDIR"; }
    else
    { mkdir -p "$DUNSTDIR"; cp -rf $DIR/dunst/* "$DUNSTDIR"; }
    fi

    if [[ -f "$DUNSTDIR/dunstrc" ]]; then
    echo -e "[*] Successfully installed...\n"
    else
    echo -e "[!] Failed to install... \n"
    fi
}

install_xresources() 
{
    if [[ -d "$HOME/.config/.Xresources" ]]; then
    cp $DIR/.Xresources "$HOME/.config/.Xresources"
    echo -e "[*] Installed Xresources...\n"
    else
    echo -e "[!] Failled to install... \n"
    fi
}

interface()
{
    clear
    cat <<-EOF
    [*] Install Rice...
    
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
    install_dunst
    install_xresources
    elif [[ $REPLY == "2" ]]; then
	echo -e "Exiting the install wizard..."
	exit 1
    else
	echo -e "\n[!] Invalid Option.\n[!] Exiting...\n"
	exit 1
    fi
}

interface
