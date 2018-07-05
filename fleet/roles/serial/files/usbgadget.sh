#!/bin/bash -e

# https://www.kernel.org/doc/Documentation/usb/gadget_configfs.txt
# https://www.kernel.org/doc/Documentation/ABI/testing/configfs-usb-gadget-mass-storage
# https://www.kernel.org/doc/Documentation/ABI/testing/configfs-usb-gadget-acm

cd /sys/kernel/config/usb_gadget/
mkdir g && cd g

echo 0x1d6b > idVendor  # Linux Foundation
echo 0x0104 > idProduct # Multifunction Composite Gadget
echo 0x0100 > bcdDevice # v1.0.0
echo 0x0200 > bcdUSB    # USB 2.0

echo 0xEF > bDeviceClass
echo 0x02 > bDeviceSubClass
echo 0x01 > bDeviceProtocol

mkdir -p strings/0x409
echo "deadbeefabad1dea" > strings/0x409/serialnumber
echo "FV"               > strings/0x409/manufacturer
echo "Pi Zero Gadget"   > strings/0x409/product

mkdir -p functions/acm.usb0                # serial
mkdir -p functions/mass_storage.usb0/lun.0 # USB drive
echo 1                                  > functions/mass_storage.usb0/lun.0/cdrom
echo "/var/lib/alpine-frood-x86_64.iso" > functions/mass_storage.usb0/lun.0/file

mkdir -p configs/c.1
echo 250 > configs/c.1/MaxPower
ln -s functions/acm.usb0   configs/c.1/
ln -s functions/mass_storage.usb0   configs/c.1/

udevadm settle -t 5 || :
ls /sys/class/udc/ > UDC
