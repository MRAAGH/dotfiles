#!/usr/bin/env bash

function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

xrdb .Xresources
setxkbmap -device 11 us_alt
setxkbmap -device 12 us_alt
run unclutter
~/.fehbg
# feh --bg-scale ~/.bgs

pulseaudio -k
sleep 1
run pulseaudio
sleep 0.5
pulseaudio-equalizer enable
