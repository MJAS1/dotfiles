#!/usr/bin/env bash

polybar-msg cmd quit

if autorandr --current | grep --quiet office; then
    MONITOR=DP-3-1 polybar office
    MONITOR=DP-3-3 polybar office
elif autorandr --current | grep --quiet remote; then
    polybar remote
else
    polybar main
fi
