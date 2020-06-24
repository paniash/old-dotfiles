#!/bin/sh
# A dmenu binary prompt script
# For example:
# './prompt "Do you want to shutdown?" "shutdown -h now"

[ $(echo -e "No\nYes" | dmenu -i -p "Do you want to shutdown?") \
	= "Yes" ] && shutdown -h now 
