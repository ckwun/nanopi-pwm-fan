## About

Shell script for enabling PWM fan control on [FriendlyElec](https://www.friendlyelec.com/) (NanoPi) SBCs.

Only tested on [NanoPi NEO3](https://wiki.friendlyelec.com/wiki/index.php/NanoPi_NEO3) with [Armbian](https://armbian.com/). But should work for most SBC with the 2pin fan connector.

## Quick Start

```bash
git clone https://github.com/ckwun/nanopi-pwm-fan
cd nanopi-pwm-fan
chmod +x start-pwm-fan install.sh  uninstall.sh
```

### Run
Run the script with default configuration:
```bash
./start-pwm-fan
```

### Config
Custom configuration can be made by modifying the pwm-fan.conf file.

Run the script with config file:
```bash
./start-pwm-fan pwm-fan.conf
```
| Name | Description | Default |
|---|---|---|
| PWM | PWM API path | "/sys/class/pwm/pwmchip0" |
| TEMP | Thermal API path | "/sys/class/thermal/thermal_zone0/temp" |
| PERIOD | Total period of the PWM signal | 8000000 |
| POLARITY | Polarity of the PWM signal | "normal" |
| TARGET_TEMPS | If current temperature is greater than TARGET_TEMPS[i], duty cycle will be set to DUTY_CYCLES[i] | (65000 60000 55000 50000) |
| DUTY_CYCLES | The active time of the PWM signal | (8000000 6000000 4000000 2000000) |
| DEFAULT_DUTY_CYCLE | Duty cycle will be set to this value if current temperature is lower than all TARGET_TEMPS | 0 |

For more info, see: [kernel.org - Pulse Width Modulation (PWM) interface](https://www.kernel.org/doc/Documentation/pwm.txt)

### Install
Install it as systemd service, and enable it to auto start at boot:
```bash
./install.sh
```

### Uninstall
Stop and disable the service, remove all files added by install.sh:
```bash
./uninstall.sh
```