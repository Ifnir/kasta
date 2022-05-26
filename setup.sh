#!/usr/bin/env bash

# Install script for polybar and rofi

# Directories
DIR=`pwd`
FONTDIR="$HOME/.local/share/fonts"
POLYDIR="$HOME/.config/polybar"
DUNSTDIR="$HOME/.config/dunst"
I3DIR="$HOME/.config/i3"

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
	#mv "${POLYBAR}"/* "${POLYDIR}.old"
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

install_i3()
{
    if [[ -d "$I3DIR" ]]; then
        echo -e "[*] Copying i3 file..."
        { mkdir -p "$I3DIR"; cp -rf $DIR/i3/* "$I3DIR"; }
    else
        { mkdir -p "$I3DIR"; cp -rf $DIR/i3/* "$I3DIR"; }
    fi

    if [[ -f "$I3DIR/config" ]]; then
        echo -e "[*] Successfully installed... \n"
    else
        echo -e "[!] Failed to install... \n"
    fi
}

install_dunst() 
{
    if [[ -d "$DUNSTDIR" ]]; then
    echo -e "[*] Creating a backup of your dunst config..."
    #mv "${DUNSTDIR}"/* "${DUNSTDIR}.old"
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
    cp $DIR/.Xresources "$HOME/.config/.Xresources"

    if [[ -f "$HOME/.config/.Xresources" ]]; then
    echo -e "[*] Installed Xresources...\n"
    else
    echo -e "[!] Failled to install... \n"
    fi
}

interface()
{
    clear

echo -e   " [*] Install Rice..."
echo -e  "  [*] Choose -"
echo -e "[1] Install All"
echo -e  "[2] Install Dunst"
echo -e "[3] Install Xresources"
echo -e "[4] Install i3 config"
echo -e "[5] Install theme"
echo -e "[6] Exit"

    read -p "[?] Select Option : "

    if [[ $REPLY == "1" ]]; then
	echo -e "Installing..."
	STYLEDIR='styles'
	install_fonts
	install_theme
        install_dunst
        install_xresources
        install_i3
    elif [[ $REPLY == "5" ]]; then
        STYLEDIR='styles'
        install_theme
        install_fonts
        exit 1
    elif [[ $REPLY == "4" ]]; then
        install_i3
        exit 1
    elif [[ $REPLY == "6" ]]; then
	echo -e "Exiting the install wizard..."
	exit 1
    else
	exit 1
    fi
}

interface
