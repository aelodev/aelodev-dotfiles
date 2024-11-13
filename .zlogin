f [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
    if [[ ! -f /tmp/tty1_logged_in ]]; then
        touch /tmp/tty1_logged_in
        exec Hyprland &>/dev/null
	exec asusctl profile --profile-set Performance > /dev/null 2>&1
        rm /tmp/tty1_logged_in
        pkill -KILL -u $USER
    fi
fi
