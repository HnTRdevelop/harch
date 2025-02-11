#!/bin/bash

echo "|---------------------------------------------------------------|"
echo "|       HArch - HnTR arch + hyprland installation script        |"
echo "|This script will install and configure everything automatically|"
echo "|---------------------------------------------------------------|"

while :; do
    echo "Proceed? [Y/n]"
    read
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

while :;
do
    echo "Install dependencies? [y/N]"
    read
    if [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ] || [ "$REPLY" = "" ]; then
        break
    elif [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]; then
        echo installing needed packages
        yay -Syu hyprland waybar hyprshot hyprpaper hyprlock hyprpicker copyq nekoray firefox nemo dunst gedit kitty wofi gnome-calculator vscodium pwvucontrol ponymix brightnessctl hyprpicker gnome-calendar loupe blueman adwaita-qt6-git adwaita-qt5-git viu hyprpolkitagent
        break
    fi
done

while :; do
    echo "Delete old .config folder? [y/N]"
    read
    if [ "$REPLY" = "n" ] || [ "$REPLY" = "N" ] || [ "$REPLY" = "" ]; then
        break
    elif [ "$REPLY" = "Y" ] || [ "$REPLY" = "y" ]; then
        echo purging .config folder...
        for i in $(ls ./files/.config/); do
            rm -rf ~/.config/$i
        done
        break
    fi
done

echo copying configuration files...
cp -rf ./files/.config/* ~/.config/
cp -rf ./files/.icons/ ~/
cp -rf ./files/.themes ~/

echo enabling some things...
systemctl --user enable waybar
systemctl --user enable hyprpaper
systemctl --user enable hyprpolkitagent.service

systemctl --user restart waybar
systemctl --user restart hyprpaper
systemctl --user restart hyprpolkitagent.service
echo "hyprland reload: $(hyprctl reload)"

echo All done!
