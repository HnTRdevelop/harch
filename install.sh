#!/bin/bash

echo HArch - HnTR arch + hyprland installation script
echo This script will install and configure everything automatically

while :;
do
    echo "Proceed? [Y/n]"
    read
    echo 
    if [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ]; then
        echo canceling...
        exit
    elif [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ] || [ "$REPLY" = "" ]; then
        echo proceeding...
        break
    fi
done

if [ "$(pacman -Qsq yay)" != "yay" ]; then
    echo firstly install yay
    exit
fi

echo
while :;
do
    echo "Install dependencies? [y/N]"
    read
    echo 
    if [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ] || [ "$REPLY" = "" ]; then
        break
    elif [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]; then
        echo installing needed packages
        yay -Syu hyprland waybar hyprshot hyprpaper hyprlock hyprpicker copyq nekoray firefox nemo dunst gedit kitty wofi gnome-calculator vscodium pwvucontrol ponymix brightnessctl hyprpicker gnome-calendar loupe blueman adwaita-qt6-git adwaita-qt5-git viu hyprpolkitagent
        break
    fi
done

echo 
echo clearing .config folder...
here=$(pwd)
to_remove=$(ls "$(pwd)/files/.config")
cd ~/.config
rm -r $to_remove
cd $here

echo
echo copying configuration files...
cp -r ./files/.config/* ~/.config/
cp -r ./files/.icons/ ~/
cp -r ./files/.themes ~/

echo
echo enabling some things...
systemctl --user enable waybar
systemctl --user enable hyprpaper
systemctl --user enable hyprpolkitagent.service

echo
echo
echo All done!
