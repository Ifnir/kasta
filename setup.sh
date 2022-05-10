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
	echo -e "[*] Copy polybar config..."
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
    echo -e "[*] Copying dunst config..."
    { mkdir -p "$DUNSTDIR"; cp -rf $DIR/dunst/* "$DUNSTDIR"; }

    if [[ -f "$DUNSTDIR/dunstrc" ]]; then
    echo -e "[*] Successfully installed...\n"
    else
    echo -e "[!] Failed to install... \n"
    fi
}

install_xresources() 
{
    cp $DIR/.Xresources "$HOME/.config/.Xresources

    if [[ -f "$HOME/.config/.Xresources" ]]; then
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
    [1] Install Polybar
    [2] Install Dunst
    [3] Install Xresources
    [4] Exit
EOF
    
    read -p "[?] Select Option : "

    if [[ $REPLY == "1" ]]; then
	echo -e "Installing..."
	STYLEDIR='styles'
	install_fonts
	install_theme
    elif [[ $REPLY == "2" ]]; then
	echo -e "Install dunst..."
	install_dunst
    elif [[ $REPLY == "3" ]]; then
	 echo -e "Install Xresources..."
	 install_xresources
    elif [[ $REPLY == "4" ]]; then
	echo -e "Exiting the install wizard..."
	exit 1
    else
	echo -e "\n[!] Invalid Option.\n[!] Exiting...\n"
	exit 1
    fi
}

interface
