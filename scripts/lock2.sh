#!/usr/bin/env bash

icon="$HOME/pictures/lock_ricknmorty.png"
tmpbg='/tmp/screen.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg" --overwrite
convert "$tmpbg" -blur "0x3" "$tmpbg"
convert "$tmpbg" "$icon" -gravity center -composite -matte "$tmpbg"
i3lock -u -i "$tmpbg"
