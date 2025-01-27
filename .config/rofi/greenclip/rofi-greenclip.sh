#!/bin/bash

theme="$HOME/.config/rofi/launchers/type-4/style-4.rasi"

rofi \
    -modi "clipboard:greenclip print" \
    -theme "$theme" \
    -show clipboard \
    -run-command '{cmd}'
