dir="$HOME/.config/rofi/launcher"
theme=$1

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi \
    -hover-select \
    -run-command "uwsm app -- {cmd}"
