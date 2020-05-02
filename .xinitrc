#!/bin/sh

[ -f "~/.xprofile" ] && . ~/.xprofile

# Here we start dwm
# The loop is just to enable dwm's "restart" feature

while :; do
	ssh-agent dwm || break
done	

