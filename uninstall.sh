#!/bin/bash

if command -v systemctl &> /dev/null
then
    systemctl stop pwm-fan.service
    systemctl disable pwm-fan.service
fi

rm -rf /usr/bin/start-pwm-fan
rm -rf /etc/pwm-fan.conf
rm -rf /lib/systemd/system/pwm-fan.service