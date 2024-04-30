#! /bin/sh

#op=$( echo -e " Poweroff\n Reboot\n Suspend\n Lock\n Logout" | wofi -i --dmenu | awk '{print tolower($2)}' )

#case $op in 
#        poweroff)
#                ;&
#        reboot)
#                ;&
#        suspend)
#                systemctl $op
#                ;;
#        lock)
#	swaylock
#                ;;
#        logout)
#                swaymsg exit
#                ;;
#esac

op=$( echo -e "  Poweroff\n  Reboot\n  Lock\n  Logout" | wofi -i --dmenu --height=210 --width=340  | awk '{print tolower($2)}' )

case $op in 
    poweroff)
        ;&
    reboot)
        sudo $op
        ;;
    lock)
        swaylock
        ;;
    logout)
        swaymsg exit
        ;;
esac

