#!/usr/bin/env bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
# echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
# polybar -c /home/matt/myrepo/polybar/config.ini mainbar-i3 2>&1 | tee -a /tmp/polybar1.log & disown
# polybar -c /home/matt/myrepo/polybar/config.ini mainbar2-i3 2>&1 | tee -a /tmp/polybar1.log & disown

polybar -c /home/kit/.config/polybar/config.ini example 2>&1 | tee -a /tmp/polybar.log & disown
