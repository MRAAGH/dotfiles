# This file has been auto-generated by i3-config-wizard(1).
# It will not be overwritten, so edit it as you like.
#
# Should you change your keyboard layout some time, delete
# this file and re-run i3-config-wizard(1).
#

# exec --no-startup-id feh --bg-scale ~/.bg

# i3 config file (v4)
#
# Please see http://i3wm.org/docs/userguide.html for a complete reference!

set $term urxvt
set $mod Mod4
exec --no-startup-id feh --bg-scale ~/.bg

exec --no-startup-id pulseaudio

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8
# font -*-gohufont-medium-r-normal-*-14-100-100-100-*-*-iso10646-1

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn’t scale on retina/hidpi displays.

# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

# start dmenu (a program launcher)
#bindsym $mod+d exec --no-startup-id dmenu_run -fn "xft:droid sans:bold:pixelsize=11:antialias=true:hinting=slight" -nb "#0f0f0f" -nf "#a6a6a6" -sb "#0f0f0f" -sf "#8f8fed"
#bindsym 0xffe4 exec --no-startup-id dmenu_run
#bindsym 0xffe4 exec --no-startup-id my-dmenu-run
#bindsym $mod+0xffe4 exec --no-startup-id my-dmenu-run-history

# just like dmenu_run, except it also appends the result to ~/.bash_history"
bindsym $mod+0xffe4 exec --no-startup-id dmenu_path | awk '!a[$0]++' | dmenu "$@" | tee -a ~/.bash_history | ${SHELL:-"/bin/sh"} && bh-cleanup
# this one also grabs commands from ~/.bash_history, and appends the result ofc.
bindsym 0xffe4 exec --no-startup-id dmenu_path | tac ~/.bash_history - | awk '!a[$0]++' | dmenu "$@" -l 10 | tee -a ~/.bash_history | ${SHELL:-"/bin/sh"} && bh-cleanup


# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym $mod+d exec --no-startup-id i3-dmenu-desktop


# window colours: border background text    indicator child_border
# client.focused        #4c7899 #285577 #ffffff #2e9ef4 #285577
# client.focused_inactive    #0F0F0F #7FB256 #E5E5E5
# client.unfocused    #0F0F0F #5697B2 #E5E5E5
# client.urgent #0F0F0F #BC9B54 #E5E5E5




bindsym $mod+Shift+grave exit 
#bindsym $mod+Control+` 

#bindsym $mod+1 
#bindsym $mod+Shift+1
bindsym $mod+Control+1 exec --no-startup-id systemctl poweroff 

#bindsym $mod+2
#bindsym $mod+Shift+2
bindsym $mod+Control+2 exec --no-startup-id systemctl reboot

bindsym $mod+3 exec --no-startup-id $term -e vim ~/.config/i3/config
#bindsym $mod+Shift+3
#bindsym $mod+Control+3

bindsym $mod+4 exec --no-startup-id $term -e vim ~/.vimrc
#bindsym $mod+Shift+4
#bindsym $mod+Control+4

bindsym $mod+5 exec --no-startup-id $term -e vim ~/.config/ranger/rc.conf
#bindsym $mod+Shift+5
#bindsym $mod+Control+5

#bindsym $mod+6
#bindsym $mod+Shift+6
#bindsym $mod+Control+6

#bindsym $mod+7
#bindsym $mod+Shift+7
#bindsym $mod+Control+7

#bindsym $mod+8
#bindsym $mod+Shift+8
#bindsym $mod+Control+8

#bindsym $mod+9
#bindsym $mod+Shift+9
#bindsym $mod+Control+9

#bindsym $mod+0
#bindsym $mod+Shift+0
#bindsym $mod+Control+0

#bindsym $mod+minus
#bindsym $mod+Shift+minus
bindsym $mod+Control+minus exec --no-startup-id amixer -q set Master 2dB- unmute

#bindsym $mod+equal
#bindsym $mod+Shift+equal
bindsym $mod+Control+equal exec --no-startup-id amixer -q set Master 2dB+ unmute

#bindsym $mod+Tab
#bindsym $mod+Shift+Tab
#bindsym $mod+Control+Tab

#bindsym $mod+q 
bindsym $mod+Shift+q kill
#bindsym $mod+Control+q

bindsym $mod+w layout tabbed
#bindsym $mod+Shift+w 
#bindsym $mod+Control+w

bindsym $mod+e layout default
bindsym $mod+Shift+e layout toggle split
#bindsym $mod+Control+e

#bindsym $mod+r 
bindsym $mod+Shift+r restart
#bindsym $mod+Control+r

bindsym $mod+t exec --no-startup-id thunar
bindsym $mod+Shift+t exec --no-startup-id $term -e htop
#bindsym $mod+Control+t

# TODO: make screen switching relative without wrapping.
# With wrapping would be "focus output right"
# absolute would be "focus output DisplayPort-0"
bindsym $mod+y focus output left
bindsym $mod+Shift+y move container to output left
bindsym $mod+Control+y exec --no-startup-id "mpc seek -00:01:00"

bindsym $mod+u exec --no-startup-id "i3-msg workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') - $( if [ $(( $(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') % 100)) -eq 1 ]; then echo 0; else echo 1; fi)))"
bindsym $mod+Shift+u exec --no-startup-id "i3-msg move container to workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') - $( if [ $(( $(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') % 100)) -eq 1 ]; then echo 0; else echo 1; fi)))"
bindsym $mod+Control+u exec --no-startup-id "mpc seek -00:00:10"

bindsym $mod+i exec --no-startup-id "i3-msg workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') + 1))"
bindsym $mod+Shift+i exec --no-startup-id "i3-msg move container to workspace $(($(i3-msg -t get_workspaces | jq '.[] | select(.focused == true).num') + 1))"
bindsym $mod+Control+i exec --no-startup-id "mpc seek +00:00:10"

bindsym $mod+o focus output right
bindsym $mod+Shift+o move container to output right
bindsym $mod+Control+o exec --no-startup-id "mpc seek +00:01:00"

#bindsym $mod+p 
#bindsym $mod+Shift+p 
#bindsym $mod+Control+p exec --no-startup-id "mpc seek +00:01:00"

bindsym $mod+bracketleft exec --no-startup-id /usr/local/bin/riot-web
#bindsym $mod+Shift+bracketleft 
#bindsym $mod+Control+bracketleft

bindsym $mod+bracketright exec --no-startup-id ~/.bin/txth
#bindsym $mod+Shift+bracketright 
#bindsym $mod+Control+bracketright

#bindsym $mod+backspace
#bindsym $mod+Shift+backspace
#bindsym $mod+Control+backspace

bindsym $mod+a focus parent
#bindsym $mod+Shift+a 
#bindsym $mod+Control+a

bindsym $mod+s layout stacking
#bindsym $mod+Shift+s 
#bindsym $mod+Control+s

#bindsym $mod+d 
#bindsym $mod+Shift+d 
#bindsym $mod+Control+d 

bindsym $mod+f fullscreen toggle
#bindsym $mod+Shift+f 
#bindsym $mod+Control+f

bindsym $mod+g exec --no-startup-id gimp
#bindsym $mod+Shift+g 
#bindsym $mod+Control+g

bindsym $mod+h focus left
bindsym $mod+Shift+h move left
bindsym $mod+Control+h exec --no-startup-id "mpc seek -10%"

bindsym $mod+j focus down
bindsym $mod+Shift+j move down
bindsym $mod+Control+j exec --no-startup-id "mpc next"

bindsym $mod+k focus up
bindsym $mod+Shift+k move up
bindsym $mod+Control+k exec --no-startup-id "mpc prev"

bindsym $mod+l focus right
bindsym $mod+Shift+l move right
bindsym $mod+Control+l exec --no-startup-id "mpc seek +10%"

#bindsym $mod+semicolon
bindsym $mod+Shift+semicolon split v
bindsym $mod+Control+semicolon [instance="dropdown"] scratchpad show; [instance="dropdown"] move position center

bindsym $mod+apostrophe exec --no-startup-id $term -e env EDITOR=vim /usr/bin/ranger
#bindsym $mod+Shift+apostrophe exec --no-startup-id $term -e env EDITOR=vim /usr/bin/ranger
#bindsym $mod+Control+'

bindsym $mod+backslash exec --no-startup-id /usr/bin/firefox
#bindsym $mod+Shift+backslash 
#bindsym $mod+Control+\

bindsym $mod+Return exec --no-startup-id $term
#bindsym $mod+Shift+Return 
#bindsym $mod+Control+return

bindsym $mod+z exec --no-startup-id "i3lock -i ~/.lockbg -t -f -e"
bindsym $mod+Shift+z exec --no-startup-id kazam
#bindsym $mod+Control+z

bindsym $mod+x exec --no-startup-id "pulseaudio -k; sleep 0.1; pulseaudio"
bindsym $mod+Shift+x exec --no-startup-id "pulseaudio -k; sleep 0.1; pulseaudio; sleep 1.0; mpc play"
#bindsym $mod+Control+x

bindsym $mod+c focus child
bindsym $mod+Shift+c reload
#bindsym $mod+Control+c

#bindsym $mod+v 
#bindsym $mod+Shift+v 
#bindsym $mod+Control+v

bindsym $mod+b split h
#bindsym $mod+Shift+b 
#bindsym $mod+Control+b

bindsym $mod+n resize grow left 10 px or 10 ppt
bindsym $mod+Shift+n resize shrink right 10 px or 10 ppt
#bindsym $mod+Control+n

bindsym $mod+m resize grow down 10 px or 10 ppt
bindsym $mod+Shift+m resize shrink up 10 px or 10 ppt
bindsym $mod+Control+m exec --no-startup-id "mpc single on"

bindsym $mod+comma resize grow up 10 px or 10 ppt
bindsym $mod+Shift+comma resize shrink down 10 px or 10 ppt
bindsym $mod+Control+comma exec --no-startup-id "mpc toggle"

bindsym $mod+period resize grow right 10 px or 10 ppt
bindsym $mod+Shift+period resize shrink left 10 px or 10 ppt
bindsym $mod+Control+period exec --no-startup-id "mpc stop"

#bindsym $mod+slash
#bindsym $mod+Shift+slash
bindsym $mod+Control+slash exec --no-startup-id "mpc single off"

bindsym $mod+space focus mode_toggle
bindsym $mod+Shift+space floating toggle
#bindsym $mod+Control+space 






# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
	position bottom
        mode hide
        hidden_state hide
        modifier Mod5
        status_command i3status
        tray_output primary
}


#bindsym $mod+Control+Delete exec --no-startup-id "mpc del 0"
#bindsym $mod+Control+equal exec --no-startup-id amixer -q set Master 4%+ unmute


# TODO: something else than mod5+backspace pls
# a different caps lock
bindsym Mod5+BackSpace exec --no-startup-id xdotool key Caps_Lock


# HALT ALL THE THINGS
bindsym $mod+Mod1+Control+Return exec --no-startup-id halt-scripts

# lock screen
# bindsym $mod+o exec --no-startup-id "i3lock -c 101820 -u"


# scrot - root
#bindsym Print exec --no-startup-id scrot -e 'mv $f ~/pict/scr'
# scrot - select window or rectangle
#bindsym --release Shift+Print exec --no-startup-id scrot -s -e 'mv $f ~/pict/scr/'
# scrot & gimp - root
#bindsym Control+Print exec --no-startup-id scrot -e 'mv $f /tmp/ && gimp /tmp/$f'
# scrot & gimp - select window or rectangle
#bindsym --release Shift+Control+Print exec --no-startup-id scrot -s -e 'mv $f /tmp/ && gimp /tmp/$f'

bindsym Print exec --no-startup-id xfce4-screenshooter

# move workspaces between screens
bindsym $mod+Shift+Left move workspace to output left
bindsym $mod+Shift+Right move workspace to output right

# cut and uncut ethernet
bindsym Control+KP_Subtract exec --no-startup-id sudo /sbin/ifconfig enp4s0 down
bindsym Control+KP_Add exec --no-startup-id sudo /sbin/ifconfig enp4s0 up






# SCRATCHPAD ^.^
# TODO: without these bindings. Scratchpad should be absolute.
# Make the currently focused window a scratchpad
bindsym $mod+Shift+minus move scratchpad
# Show the first scratchpad window
bindsym $mod+minus scratchpad show










# default_border pixel 0
# default_border none
hide_edge_borders both

bindsym $mod+Shift+Control+7 border pixel 3
bindsym $mod+Shift+Control+8 border normal
# new i3
# for_window [tiling] border pixel 3
# old i3
for_window [workspace=__focused__] border pixel 3

#focus_wrapping no


# network manager applet is nice I guess
exec --no-startup-id nm-applet

# start some stuff
for_window [instance="dropdown"] floating enable
for_window [instance="dropdown"] move scratchpad 
#for_window [instance="dropdown"] resize set 960 700
#for_window [instance="dropdown"] move position center 
exec --no-startup-id $term -name dropdown -e ncmpc


# set up starting workspaces
workspace 101 output HDMI-A-0
workspace 201 output DVI-D-0
