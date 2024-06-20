#!/bin/bash

if ! command -v systemctl &> /dev/null
then
    echo "systemctl could not be found"
    exit 1
fi

cp -vpf start-pwm-fan /usr/bin/
chmod 0755 /usr/bin/start-pwm-fan
cp -vpf pwm-fan.conf /etc/
cp -vpf pwm-fan.service /lib/systemd/system/
systemctl enable pwm-fan.service
systemctl start pwm-fan.service