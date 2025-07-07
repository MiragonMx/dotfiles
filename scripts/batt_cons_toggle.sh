#!/bin/bash

var=$(< /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode)

if [ $var = "0" ]; then
    echo 1 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    echo 'Battery saving (charge up to ~60%) activated!'
else
    echo 0 | sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode
    echo 'Battery saving (charge up to ~60%) deactivated!'
fi
