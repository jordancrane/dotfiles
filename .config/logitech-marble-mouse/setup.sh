#!/bin/bash

arg=$1

if [[ -n $arg ]]; then
    case $arg in
        "--help" | "-h")
            echo "Usage: $0 <left-hand|right-hand>"
            ;;
        "left-hand")
            xinput set-prop "Logitech USB Trackball" "libinput Button Scrolling Button" 1
            xinput set-prop "Logitech USB Trackball" "libinput Scroll Method Enabled" 0, 0, 1
            xinput set-button-map "Logitech USB Trackball" 3 2 1 4 5 6 7 9 8
            ;;
        "right-hand")
            xinput set-prop "Logitech USB Trackball" "libinput Button Scrolling Button" 3
            xinput set-prop "Logitech USB Trackball" "libinput Scroll Method Enabled" 0, 0, 1
            xinput set-button-map "Logitech USB Trackball" 1 2 3 4 5 6 7 8 9
            ;;
        *)
            #Default to right hand config
            xinput set-prop "Logitech USB Trackball" "libinput Button Scrolling Button" 3
            xinput set-prop "Logitech USB Trackball" "libinput Scroll Method Enabled" 0, 0, 1
            xinput set-button-map "Logitech USB Trackball" 1 2 3 4 5 6 7 8 9
    esac
else
    echo "Usage: $0 <left-hand|right-hand>"
fi



