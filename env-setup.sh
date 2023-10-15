#!/bin/bash
# Script to make Pentesting enviornment ready.
# This script will connect to OSCP VPN (or any), setup qterminal with multiple slit terminals, tabs and tmux. 

# start with little delay
sleep 1

# launch qterminal
qterminal &!
sleep 1

# connect to OSCP VPN
xdotool type "cd ~/Documents/vpn/"
xdotool key Return

xdotool type "tmux new-sess -s VPN" 
xdotool key Return
sleep 1

xdotool type "sudo openvpn os.ovpn"
xdotool key Return
xdotool type "your password"
xdotool key Return
sleep 1

# open another a new qterminal
sleep 1
qterminal &!
sleep 1

xdotool type "cd ~/Documents/oscp/lab/2023/"
xdotool key Return

xdotool type "tmux" 
xdotool key Return

xdotool key Ctrl+Shift+R
xdotool type "cd ~/Documents/oscp/lab/2023/"
xdotool key Return 

xdotool type "tmux" 
xdotool key Return 

sleep 1

# open another qterminal tab
sleep 1
xdotool key Ctrl+Shift+T
sleep 1

xdotool type "cd ~/Documents/oscp/lab/2023/"
xdotool key Return

xdotool type "tmux" 
xdotool key Return

xdotool key Ctrl+Shift+R
xdotool type "cd ~/Documents/oscp/lab/2023/"
xdotool key Return 

xdotool type "tmux" 
xdotool key Return 

sleep 1

# opne one more tab
sleep 1
xdotool key Ctrl+Shift+T
sleep 1

xdotool type "cd ~/Documents/oscp/lab/2023/"
xdotool key Return

xdotool type "tmux" 
xdotool key Return
