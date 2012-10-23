#!/bin/bash -x
CYANOGENMOD=../../..

# Make mrproper
make mrproper

# Set config
make rk_defconfig
make menuconfig

# Make modules
nice -n 10 make -j2 modules

# Copy modules
find -name '*.ko' -exec cp -av {} $CYANOGENMOD/device/rockchip/rk2918/modules/ \;

# Build kernel
nice -n 10 make -j2 kernel.img
# Copy kernel
cp kernel.img $CYANOGENMOD/device/rockchip/rk2918/kernel

# Make mrproper
make mrproper

