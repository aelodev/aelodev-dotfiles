#!/usr/bin/env bash

# Device and variable names for Hyprland touchpad configuration
HYPRLAND_DEVICE="elan1203:00-04f3:307a-touchpad"
HYPRLAND_VARIABLE="device[$HYPRLAND_DEVICE]:enabled"
TOUCHPAD_STATUS="$HOME/.cache/touchpad_status"

if [ -z "$XDG_RUNTIME_DIR" ]; then
  export XDG_RUNTIME_DIR=/run/user/$(id -u)
fi

export STATUS_FILE="$XDG_RUNTIME_DIR/touchpad.status"

enable_touchpad() {
  printf "true" > "$STATUS_FILE"

  notify-send -u normal "Enabling Touchpad"

  hyprctl keyword $HYPRLAND_VARIABLE true -r
}

disable_touchpad() {
  printf "false" > "$STATUS_FILE"

  notify-send -u normal "Disabling Touchpad"

  hyprctl keyword $HYPRLAND_VARIABLE false -r
}

if ! [ -f "$STATUS_FILE" ]; then
  disable_touchpad
else
  if [ $(cat "$STATUS_FILE") = "true" ]; then
    disable_touchpad
  elif [ $(cat "$STATUS_FILE") = "false" ]; then
    enable_touchpad
  fi
fi
