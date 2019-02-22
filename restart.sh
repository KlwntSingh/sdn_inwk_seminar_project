#!/bin/bash
ip tuntap add mode tap vnet0
ip link set vnet0 up
ovs-vsctl add-port br0 vnet0
ip link
