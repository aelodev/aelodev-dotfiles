#!/usr/bin/env bash

CONFIG="$HOME/.config/hypr/wofi/config/"
STYLE="$HOME/.config/hypr/wofi/config/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi -H 400 -W 600 --show drun --conf "${CONFIG}" --style "${STYLE}" -I 
else
    pkill wofi
fi
