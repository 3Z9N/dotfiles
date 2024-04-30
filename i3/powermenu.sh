#! /bin/sh

chosen=$(printf "  Power Off\n  Restart\n  Logout" | rofi -dmenu -i -theme-str '@import "power.rasi"')

#case "$chosen" in
#    "  Power Off") poweroff ;;
#    "  Restart") reboot ;;
#    "  Lock") slock ;;
#    *) exit 1 ;;
#esac

case "$chosen" in
    "  Power Off") poweroff ;;
    "  Restart") reboot ;;
    "  Logout") i3-msg exit  ;;
    *) exit 1 ;;
esac