#!/bin/sh

set -eux

bridge_name=br0
eth_name=eth0
tap_name=tap0

# Create bridge
sudo ip link add $bridge_name type bridge

# Add ethernet to bridge
sudo ip link set $eth_name master $bridge_name

# Add tap device
sudo ip tuntap add dev $tap_name mode tap

# Add tap device to bridge
sudo ip link set $tap_name master $bridge_name

# Make everything up
sudo ip link set $bridge_name up
sudo ip link set $tap_name up

sudo qemu-system-x86_64 \
    -netdev tap,id=net0,ifname=$tap_name,script=no,downscript=no \
    -device e1000,netdev=net0 \
    -hda elementary-5.0.img \
    -m 4096
