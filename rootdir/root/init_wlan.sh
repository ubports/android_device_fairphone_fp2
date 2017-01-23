#!/system/bin/sh

## The Ubports project
## Wait for WCNSS service to setup WLAN device over QMI

while true; do
    sleep 2
    if [ ! -f /sys/devices/fb000000.qcom,wcnss-wlan/net/wlan0/address ]; then
        echo sta > /sys/module/wlan/parameters/fwpath
    else
        break
    fi
done
