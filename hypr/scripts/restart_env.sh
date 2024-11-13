#!/bin/bash

pkill waybar
wait 1
waybar &

pkill wofi
