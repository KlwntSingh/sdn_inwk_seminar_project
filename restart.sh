#!/bin/bash
ip tuntap add mode tap vnet0
ip link set vnet0 up
ovs-vsctl add-port br0 vnet0
ip link


ip tuntap add mode tap vm1
ip link set vm1 up
ovs-vsctl add-port br0 vm1


ip tuntap add mode tap vm2
ip link set vm2 up
ovs-vsctl add-port br0 vm2
