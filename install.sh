#!/bin/bash

echo "|------------------------------------------------------------------------|"
echo "|       HArch - HnTR hyprland on artix + dinit installation script       |"
echo "|    This script will install and configure everything automatically     |"
echo "|------------------------------------------------------------------------|"

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

echo enabling/restarting some things...
pkill waybar; waybar & disown
pkill hyprpaper; hyprpaper & disown
pkill dunst; dunst & disown

echo "hyprland reload: $(hyprctl reload)"

echo All done!
