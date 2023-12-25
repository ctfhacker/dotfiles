#!/bin/sh
# Left monitor
# I2C bus:       /dev/i2c-15
# Serial number: VL82107A0607 
# Right monitor
# I2C bus:       /dev/i2c-16
# Serial number: VL82107A0588

ddcutil --bus 3 setvcp 60 15
ddcutil --bus 4 setvcp 60 15
